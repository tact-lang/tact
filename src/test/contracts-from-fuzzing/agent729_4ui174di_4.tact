struct Small {
  a: Int;
}

struct Middle {
  s: String;
  inner: Small;
}

struct Big {
  text: String;
  mid: Middle;
}

contract MultiDepth {
  deep: Big;

  init() {
    self.deep = Big{
      text: "t",
      mid: Middle{
        s: "m",
        inner: Small{a: 1}
      }
    };
  }
}
