program resize_fullscreen;

{$mode objfpc}{$H+}

uses cmem,
{uncomment if necessary}
//ray_math, 
//ray_rlgl, 
ray_header; 

var
  display: integer;
  screenWidth : integer= 800;
  screenHeight : integer = 450;

begin

 SetConfigFlags(FLAG_WINDOW_RESIZABLE or FLAG_VSYNC_HINT);
 InitWindow(screenWidth, screenHeight, 'raylib [core] example - fullscreen toggle');

 SetTargetFPS(60);

 while not WindowShouldClose() do 
 begin

        if  (IsWindowResized() and IsWindowFullscreen()) then
        begin
            screenWidth := GetScreenWidth();
            screenHeight := GetScreenHeight();
        end;

        // check for alt + enter
 	if IsKeyPressed(KEY_ENTER) And (IsKeyDown(KEY_LEFT_ALT) or IsKeyDown(KEY_RIGHT_ALT)) then
 	begin
        // see what display we are on right now
          display := GetCurrentMonitor();


            if IsWindowFullscreen() then
            begin
                // if we are full screen, then go back to the windowed size
                SetWindowSize(screenWidth, screenHeight);
            end
            else
            begin
                // if we are not full screen, set the window size to match the monitor we are on
                SetWindowSize(GetMonitorWidth(display), GetMonitorHeight(display));
            end;

            // toggle the state
 			ToggleFullscreen();
 		end;


  BeginDrawing();
  ClearBackground(RAYWHITE);

  DrawText('Press Alt + Enter to Toggle full screen!', 190, 200, 20, LIGHTGRAY);

  EndDrawing(); 
 end;
CloseWindow(); 

end.

