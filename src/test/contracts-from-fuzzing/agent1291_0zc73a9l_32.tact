struct OptionalStringBool {
    s: String?;
    b: Bool?;
}

contract Test {
    f: OptionalStringBool;

    init() {
        self.f = OptionalStringBool{ s:null, b:null };
    }
}