// optional of struct with all optional fields
struct PartOpt {
  f1: Int?;
  f2: Bool?;
  f3: String?;
}

contract OptStructAllNull {
  nested: PartOpt? = null;
  init() {}
}