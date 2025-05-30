struct OptStr {
    s: String? = null;
}

contract OptStringInit {
    foo: OptStr;
    init() {
        self.foo = OptStr{};
    }
}