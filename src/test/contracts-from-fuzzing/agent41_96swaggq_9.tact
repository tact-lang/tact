struct MixedTypes {
  integer: Int;
  boolean: Bool;
  optionalString: String?;
  nested: NestedType;
}

struct NestedType {
  flag: Bool;
  text: String;
  optionalInt: Int?;
}

contract MixedStructTest {
  val: MixedTypes;

  init() {
    self.val = MixedTypes{
      integer: 100,
      boolean: false,
      optionalString: null,
      nested: NestedType{
        flag: true,
        text: "txt",
        optionalInt: null
      }
    };
  }
}
