// Contract testing struct with string defaults and nested optionals
struct D {
  a: String = "hi";
  b: Int?;
}

contract NestedOptDefaults {
    f: D?;

    init() {
        self.f = null;
    }
}
