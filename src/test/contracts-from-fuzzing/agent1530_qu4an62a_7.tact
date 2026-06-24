struct InnerLevel {
  flag: Bool;
  num: Int;
}

struct MidLevel {
  nested_inner: InnerLevel?;
  text: String;
}

struct TopLevel {
  nested_mid: MidLevel?;
  big_number: Int;
}

contract MultiOptional {
  data: TopLevel;
  init() {
    self.data = TopLevel{
      nested_mid: MidLevel{
        nested_inner: InnerLevel{flag: false, num: -42},
        text: "hi"
      },
      big_number: 100
    };
  }
}