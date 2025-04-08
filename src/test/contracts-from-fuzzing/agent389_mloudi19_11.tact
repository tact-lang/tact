struct One {
  a: Int;
}

struct Two {
  b: Bool;
}

struct Three {
  c: String;
}

struct Four {
  d: Cell;
}

struct Five {
  e: Slice;
}

contract ManyStructs {
  one: One;
  two: Two;
  three: Three;
  four: Four;
  five: Five;

  init() {
    self.one = One{a:1};
    self.two = Two{b:true};
    self.three = Three{c:"ok"};
    self.four = Four{d:emptyCell()};
    self.five = Five{e:emptyCell().asSlice()};
  }
}
