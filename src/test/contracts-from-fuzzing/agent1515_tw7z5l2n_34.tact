struct OptionalBool {
    maybe: Bool? = false;
}

contract OptBoolDefault {
    data: OptionalBool;

    init() {
        self.data = OptionalBool{};
    }

    receive() { dump(self.data.maybe); }
}