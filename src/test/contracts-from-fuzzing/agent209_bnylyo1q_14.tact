struct Pair {
  k: Int;
  v: Bool;
}

struct Outer {
  p1: Pair;
  p2: Pair;
  p3: Pair;
  p4: Pair;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{
      p1: Pair{k:1,v:true},
      p2: Pair{k:2,v:false},
      p3: Pair{k:3,v:true},
      p4: Pair{k:4,v:false}
    };
  }
}