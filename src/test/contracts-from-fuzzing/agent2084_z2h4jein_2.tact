struct DeepNested {
  inner: Inner;
}

struct Inner {
  flag: Bool;
  data: DataWrap;
}

struct DataWrap {
  amount: Int;
  message: String;
}

contract Test {
  store: DeepNested;
  
  init() {
    self.store = DeepNested{
      inner: Inner{
        flag: true,
        data: DataWrap{
          amount: 12345,
          message: "deep"
        }
      }
    };
  }
}
