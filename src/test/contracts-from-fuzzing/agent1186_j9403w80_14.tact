struct T1 {
 x: Int;
}

struct T2 {
 y: Int;
}

struct Agg {
  st1: T1;
  st2: T2;
}

contract AggStructContract {
  agg: Agg;

  init() {
    self.agg = Agg{
      st1: T1{x: 11},
      st2: T2{y: 22},
    };
  }
}
