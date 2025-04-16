struct Nested {
  inner: Inner;
  optInner: Inner?;
}

struct Inner {
  flag: Bool;
  count: Int;
  message: MessageStruct;
}

message(1) MessageStruct {
  text: String;
  optText: String?;
}

contract StorageContract {
  data: Nested;

  init() {
    self.data = Nested{
      inner: Inner{
        flag: true,
        count: 42,
        message: MessageStruct{
          text: "Hello",
          optText: null
        }
      },
      optInner: null
    };
  }
}