struct Inner1 { a: Int; b: String; }
struct Inner2 { c: Bool; d: Slice; }

struct Middle {
  i1: Inner1;
  i2: Inner2;
}

contract NestedStructs {
  data: Middle;

  init() {
    self.data = Middle{
      i1: Inner1{ a: 10, b: "hi" },
      i2: Inner2{ c: true, d: emptyCell().asSlice() },
    };
  }
}