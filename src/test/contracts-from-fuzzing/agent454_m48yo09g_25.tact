struct Comp1 { x:Int }
struct Comp2 { y:Int }
struct Comp3 { z:Int }

struct Agg {
  c1:Comp1;
  c2:Comp2;
  c3:Comp3;
}

contract AggFields {
  agg:Agg;
  init() {
    self.agg = Agg{c1:Comp1{x:1}, c2:Comp2{y:2}, c3:Comp3{z:3}};
  }
}