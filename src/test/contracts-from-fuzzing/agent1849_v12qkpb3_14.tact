struct OnlyOptionalFields {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract AllOptionalStruct {
  record: OnlyOptionalFields;

  init() {
    self.record = OnlyOptionalFields{ x: null, y: null, z: null };
  }
}