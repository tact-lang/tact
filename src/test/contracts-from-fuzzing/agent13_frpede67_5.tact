struct OptionalStruct {
  nested: Nested?;
}

struct Nested {
  val: Int;
}

contract TestContract {
    val: OptionalStruct;
    init() {
        self.val = OptionalStruct { nested: null };
    }
}