struct Nested {
  inner: InnerStruct;
}

struct InnerStruct {
  flag: Bool;
  count: Int;
  desc: String;
}

contract TestMultilevel {
  record: Nested;

  init() {
    self.record = Nested{
      inner: InnerStruct{
        flag: true,
        count: 42,
        desc: "hello",
      },
    };
  }
}