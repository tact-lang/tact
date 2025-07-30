struct ContainsOptional {
  o1: Int?;
  o2: Bool?;
  o3: String?;
}

contract OptionalFields {
  val: ContainsOptional;

  init() {
    self.val = ContainsOptional{ o1: null, o2: true, o3: "hello" };
  }
}