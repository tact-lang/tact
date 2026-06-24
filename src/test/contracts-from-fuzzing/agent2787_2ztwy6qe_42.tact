struct Leaf {
  a: Int? = null;
  b: Bool? = false;
}

struct Inner {
  leaf: Leaf? = null;
  c: Int? = null;
}

struct Wrap {
  inner: Inner? = null;
  txt: String? = null;
}

contract DefaultNest {
  data: Wrap?;

  init() {
    self.data = Wrap{
      inner: Inner{ leaf: Leaf{ a: null, b: null }, c: null },
      txt: "hi"
    };
  }
}
