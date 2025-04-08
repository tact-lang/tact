struct SubA { x:Int }
struct SubB { y:Bool }
struct Outer {
  a:SubA; b:SubB; other:Int;
}

contract NestedStructs {
  s:Outer;
  init() {
    self.s = Outer{
      a:SubA{x:1},
      b:SubB{y:true},
      other:42
    };
  }
}