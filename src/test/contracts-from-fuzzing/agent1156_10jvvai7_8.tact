struct ChildA { i: Int; }
struct ChildB { b: Bool; }
struct ChildC { s: String; }

struct Parent {
  ca: ChildA;
  cb: ChildB;
  cc: ChildC;
}

contract CrossNested {
  data: Parent;

  init() {
    self.data = Parent{
      ca: ChildA{ i: 1 },
      cb: ChildB{ b: true },
      cc: ChildC{ s: "x" },
    };
  }
}