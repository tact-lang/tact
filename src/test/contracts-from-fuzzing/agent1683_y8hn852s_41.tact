// Edge test: empty optional string assigned default null explicitly

struct OptStr {
    s: String? = null;
}

contract NullByDefault {
    foo: OptStr;

    init() {
        self.foo = OptStr{};
    }

    receive() {
        self.foo = OptStr{ s: "hi" };
    }
}