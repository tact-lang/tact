struct Nested {
 s: String;
 i: Int;
 b: Bool;
}

contract ManyVars {
 a: Int;
 b: Bool;
 c: String;
 d: Nested;

 init() {
  self.a=1; self.b=true; self.c="ok";
  self.d=Nested{ s:"hi", i:2, b:false };
 }
}