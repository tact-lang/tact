struct SLayer1 {x:Int}
struct SLayer2 {a:SLayer1; b:SLayer1}
struct SLayer3 {a:SLayer2; b:SLayer2}

contract SymmetricNest {
  root:SLayer3;

  init() {
    self.root = SLayer3{
      a:SLayer2{a:SLayer1{x:1},b:SLayer1{x:2}},
      b:SLayer2{a:SLayer1{x:3},b:SLayer1{x:4}}
    };
  }
}