struct Chain3 { x: Int; y: String; }
struct Chain2 { c3: Chain3; flag: Bool; }
struct Chain1 { c2: Chain2; num: Int; }

contract ChainNest {
  a: Int;
  b: Chain1;

  init() {
    self.a = 1;
    self.b = Chain1{c2: Chain2{c3: Chain3{x:5,y:"s"}, flag:true}, num:99};
  }
}
