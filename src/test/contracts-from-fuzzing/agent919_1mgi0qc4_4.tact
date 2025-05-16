struct OptionalBoolField {
  flag1: Bool?;
  flag2: Bool?;
  flag3: Bool?;
  flag4: Bool?;
}

contract OptionalsTest {
    flags: OptionalBoolField;

    init() {
        self.flags = OptionalBoolField{
            flag1: null,
            flag2: true,
            flag3: false,
            flag4: null
        };
    }
}