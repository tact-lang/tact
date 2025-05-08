struct OptStringBool {
    s: String?;
    b: Bool?;
}

contract OptStructDefault {
    nested: OptStringBool = OptStringBool{ s: null, b: null };

    init() {
        self.nested = OptStringBool{ s: null, b: null };
    }
}