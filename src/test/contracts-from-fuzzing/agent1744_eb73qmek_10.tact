// struct with default optional null and nested struct with default field
struct NestedWithDefault {
  x: Int = 123;
}

struct DefaultsStruct {
  val1: Int = 7;
  val2: Bool = false;
  optionalVal: String?; // implicitly null default
  nested: NestedWithDefault = NestedWithDefault{};
}

contract DefaultsStorage {
  d: DefaultsStruct;

  init() {
    self.d = DefaultsStruct{};
  }
}
