// Struct with mix of primitives and multiple nested structs
struct A { x:Int; y:Bool; }
struct B { z:String; a:A; }
struct C { b:B; k:Cell; }

contract Test {
  data: C;

  init() {
    self.data = C{
      b: B{
        z:"x", a: A{x:1,y:true}
      },
      k: emptyCell()
    };
  }
}