struct InnerA {
  valA: Int;
}

struct InnerB {
  valB: Int;
}

struct TopStruct {
  one: InnerA;
  two: InnerB;
  optInner: InnerB?;
  str: String;
  flag: Bool;
}

contract NestedOpts {
  big: TopStruct;

  init() {
    self.big = TopStruct{
      one: InnerA{ valA: 777 },
      two: InnerB{ valB: 888 },
      optInner: null,
      str: "nested",
      flag: true,
    };
  }
}
