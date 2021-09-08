program game;

{$mode objfpc}{$H+}

uses cmem,
{uncomment if necessary}
//ray_math, 
//ray_rlgl, 
ray_header; 

const
 screenWidth = 800;
 screenHeight = 450;

begin

 InitWindow(screenWidth, screenHeight, 'raylib pascal - basic window');
 SetTargetFPS(60);

 while not WindowShouldClose() do 
 begin
  BeginDrawing();
  ClearBackground(RAYWHITE);

  DrawText('raylib in lazarus !!!', 20, 20, 20, SKYBLUE);

  EndDrawing(); 
 end;
CloseWindow(); 

end.

