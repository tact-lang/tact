struct OptionalFields {
  title: String;
  note: String?;
  number: Int?;
  flag: Bool?;
}

contract OptionalStorage {
  record: OptionalFields;

  init() {
    self.record = OptionalFields{
      title: "t",
      note: null,
      number: null,
      flag: null,
    };
  }
}
