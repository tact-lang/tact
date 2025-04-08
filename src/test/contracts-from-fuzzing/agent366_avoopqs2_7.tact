struct OneBig {
  s: String;
  i: Int;
  b: Bool;
  o: Int?;
  p: String?;
}

struct TwoBig {
  a: OneBig;
  b: OneBig;
  c: Bool;
}

contract NestedBig {
  v: TwoBig;
  init() {
    self.v = TwoBig{
      a: OneBig{
        s: "A",
        i: 1,
        b: true,
        o: null,
        p: null
      },
      b: OneBig{
        s: "B",
        i: 2,
        b: false,
        o: 5,
        p: "hey"
      },
      c: true
    };
  }
}