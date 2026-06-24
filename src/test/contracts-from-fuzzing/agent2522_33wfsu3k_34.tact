struct OptionalBool {
    x: Bool?;
}

contract TestContract {
    ob: OptionalBool;

    init() {
        self.ob = OptionalBool { x: null };
    }
}