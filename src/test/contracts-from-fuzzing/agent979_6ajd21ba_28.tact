struct OptionalBool {
    a: Bool?;
    b: Bool?;
}

contract TestOptBool {
    st: OptionalBool;

    init() {
        self.st = OptionalBool{ a: null, b: null };
    }
}