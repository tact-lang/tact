struct DeepNested {
  val: Int;
  inner: InnerStruct;
}

struct InnerStruct {
  flag: Bool;
  child: ChildStruct;
}

struct ChildStruct {
  num: Int;
  opt: Bool?;
}

contract DeepContract {
  storage: DeepNested;

  init() {
    self.storage = DeepNested{
      val: 123,
      inner: InnerStruct{
        flag: false,
        child: ChildStruct{
          num: -7,
          opt: null,
        },
      },
    };
  }
}