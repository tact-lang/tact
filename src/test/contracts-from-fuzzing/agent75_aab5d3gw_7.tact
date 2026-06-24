struct Info {
  content: String;
  note: String?;
  flag: Bool;
  number: Int;
}

contract Test {
  data: Info;

  init() {
    self.data = Info{ content: "Data", note: null, flag: true, number: 100 };
  }
}