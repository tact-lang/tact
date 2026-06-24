struct OptionalStringBool {
    t: String?;
    u: Bool?;
}

contract TestContract {
    p: OptionalStringBool;

    init() {
        self.p = OptionalStringBool{ t: null, u: null };
    }
}
