struct NestedString {
  text: String;
  flag: Bool;
}

contract StrInStruct {
  data: NestedString = NestedString{ text:"hello", flag:true };
  init() {
    self.data = NestedString{ text:"world", flag:false };
  }
  receive() {}
}