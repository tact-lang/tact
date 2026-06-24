struct HasStr {
 a: String;
 b: String?;
}

contract Test {
  data: HasStr;

  init() {
    self.data = HasStr{
      a: "abc",
      b: null
    };
  }
}