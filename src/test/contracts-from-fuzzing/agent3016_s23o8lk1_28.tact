struct OptionalBool {
    f: Bool?;
}

contract TestContract {
    d: OptionalBool;

    init() {
        self.d = OptionalBool{
            f: null
        };
    }
}