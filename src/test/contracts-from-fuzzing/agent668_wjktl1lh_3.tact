struct Inner {
  val: Int;
  flag: Bool;
}

struct Outer {
  inner: Inner;
  message: String;
}

contract TestContract {
  storage: Outer;

  init() {
    self.storage = Outer {
      inner: Inner {
        val: 777,
        flag: false,
      },
      message: "nested structs",
    };
  }
}