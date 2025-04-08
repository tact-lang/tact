// Struct with optional nested struct
struct NestedOpt {
  val: String;
}

struct ContOpt {
  nested: NestedOpt?;
  flag: Bool;
}

contract OptNested {
  data: ContOpt;

  init() {
    self.data = ContOpt{
      nested: null,
      flag: true
    };
  }
}