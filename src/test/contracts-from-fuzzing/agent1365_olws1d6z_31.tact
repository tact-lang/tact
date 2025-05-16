struct OptionalBool {
    flag: Bool?;
}

contract ManyOptionalBools {
    b1: OptionalBool;
    b2: OptionalBool;
    b3: OptionalBool;

    init() {
        self.b1 = OptionalBool{flag: null};
        self.b2 = OptionalBool{flag: null};
        self.b3 = OptionalBool{flag: null};
    }
}