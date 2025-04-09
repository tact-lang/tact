// Deep nested optional in contract field initializing to null
struct InnerMost {
  val: Int;
}

struct MidContainer {
  val: InnerMost?;
}

contract OptionalContractField {
  storage: MidContainer?;

  init() {
    self.storage = null;
  }
}