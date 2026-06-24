struct Deep {
  level1: Int;
  level2: Middle?;
}

struct Middle {
  inner: Inner;
}

struct Inner {
  flag: Bool;
  text: String?;
}

contract DeepNestTest {
  deep: Deep;

  init() {
    self.deep = Deep{
      level1: 5,
      level2: Middle{
        inner: Inner{
          flag: true,
          text: null
        }
      }
    };
  }

  receive() {}
}