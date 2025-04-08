struct HasString {
  text: String;
}

struct Wrapper {
  field: HasString;
  status: Bool;
}

contract StringNested {
  data: Wrapper;

  init() {
    self.data = Wrapper{
      field: HasString{ text: "hello" },
      status: true
    };
  }
}
