struct Inner {
  value: Int;
}

struct Middle {
  inner: Inner;
  flag: Bool;
}

struct Outer {
  middle: Middle;
  label: String;
}

contract DeepContract {
  state: Outer;

  init() {
    self.state = Outer{
      middle: Middle{
        inner: Inner{
          value: 42
        },
        flag: false
      },
      label: "hello"
    };
  }
}