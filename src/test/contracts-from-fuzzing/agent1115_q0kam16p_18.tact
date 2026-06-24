struct OptionalRecord {
  name: String?;
  value: Int?;
  valid: Bool?;
}

contract OptTest {
  record: OptionalRecord;

  init() {
    self.record = OptionalRecord{
      name: null,
      value: null,
      valid: null
    };
  }
}