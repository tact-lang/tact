struct IntsA {
  a: Int;
  b: Int;
}

struct IntsB {
  x: Int;
  y: Int;
}

struct Nature {
  first: IntsA;
  second: IntsB;
}

contract MultipleGroups {
  composed: Nature;

  init() {
    self.composed = Nature{
      first: IntsA{ a:1, b:2 },
      second: IntsB{ x:3, y:4 }
    };
  }
}