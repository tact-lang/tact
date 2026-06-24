struct DeepNested {
  val: Int;
}

struct MidNested {
  deep: DeepNested;
  flag: Bool;
}

struct Outer {
  mid: MidNested;
  optInt: Int?;
  text: String;
}

contract StorageTest {
  data: Outer;

  init() {
    self.data = Outer{
      mid: MidNested{
        deep: DeepNested{ val: 42 },
        flag: true,
      },
      optInt: null,
      text: "Hello",
    };
  }
}