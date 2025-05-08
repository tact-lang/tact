struct Inner1 { x: Int; }
struct Inner2 { y: Int; }
struct Agg {
  a: Inner1;
  b: Inner2;
}

contract StructsInStruct {
  agg: Agg;

  init() {
    self.agg = Agg{a: Inner1{x:1}, b: Inner2{y:2}};
  }
}