// Contract with a message struct and nested struct with optionals and defaults
message(0xDEADBEEF) Outermsg {
  field: Int? = null;
  nested: Inner? = null;
}

struct Inner {
  x: Int = 1;
  y: String? = null;
}

contract MsgStructDefaults {
  data: Outermsg;

  init() {
    self.data = Outermsg{};
  }
}