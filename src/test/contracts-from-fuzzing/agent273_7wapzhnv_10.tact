struct StrStruct {
  text: String;
  more: String;
}

contract TestContract {
  data: StrStruct;

  init() {
    self.data = StrStruct{
      text: "hello",
      more: "world"
    };
  }
}