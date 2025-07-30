struct OptionalDefaultMixed {
    x: Int? = null;
    y: String = "hello";
    z: Bool? = true;
}

contract MixedDefaultsOptional {
    val: OptionalDefaultMixed;

    init() {
        self.val = OptionalDefaultMixed{};
    }
}