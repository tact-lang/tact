struct Sub {
  s: String;
}
struct Mid {
  sub1: Sub;
  sub2: Sub;
}
struct Top {
  mid: Mid;
  text: String;
}

contract Chain {
  node: Top;

  init() {
    self.node = Top{
      mid: Mid{
        sub1: Sub{ s:"one" },
        sub2: Sub{ s:"two" }
      },
      text: "hello"
    };
  }
}
