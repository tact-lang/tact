struct SubStruct {
  x: Int;
  y: Bool;
}

contract MixedTypes {
  a: Int;
  b: Bool;
  c: String;
  d: SubStruct;
  e: SubStruct?;

  init() {
    self.a=1; self.b=true; self.c="X";
    self.d=SubStruct{x:9,y:false};
    self.e=null;
  }
}