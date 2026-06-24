struct BigNested {
  inner1: Int;
  inner2: Bool;
  inner3: String;
  inner4: Int?;
  inner5: Bool?;
  inner6: String?;
}

struct Container {
  top1: BigNested;
  top2: BigNested;
}

contract HugeStructTest {
  data: Container;

  init() {
    self.data = Container{
      top1: BigNested{
        inner1: 1, inner2: true, inner3: "aaa", inner4: null, inner5: null, inner6: null
      },
      top2: BigNested{
        inner1: 2, inner2: false, inner3: "bbb", inner4: null, inner5: null, inner6: null
      }
    };
  }
}