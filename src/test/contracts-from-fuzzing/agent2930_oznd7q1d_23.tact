struct SubZeroDefaults {
    val: Int as uint8; // no default
}

contract MissingDefault {
    sub: SubZeroDefaults;

    init() {
        self.sub = SubZeroDefaults{
            val: -1
        };
    }
}
