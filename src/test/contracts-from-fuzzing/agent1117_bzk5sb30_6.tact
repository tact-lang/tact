struct Pair {
  a: Int;
  b: Bool;
}

struct Wrapper {
  first: Pair;
  second: Pair;
}

contract PairWrap {
  val: Wrapper;

  init() {
    self.val = Wrapper{
      first: Pair{ a:1, b:true },
      second: Pair{ a:2, b:false }
    };
  }
}
