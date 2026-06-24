struct Leaf {
  val: Int as int32;
}

struct Mid {
  a: Leaf?;
  b: Int as uint4;
}

struct Root {
  first: Mid?;
  second: Int as uint1;
}

contract SerializeNestedOptionals {
  data: Root;

  init() {
    self.data = Root{
      first: null,
      second: 1
    };
  }

  receive() {
    if (self.data.first != null) {
      let _ = self.data.first!!.a;
    }
  }
}
