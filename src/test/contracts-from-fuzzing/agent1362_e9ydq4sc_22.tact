struct DefaultsInNested {
    foo: Int = 42;
    bar: String = "hi";
}

contract Test {
    nestedOpt: DefaultsInNested? = null;

    init() {
        self.nestedOpt = DefaultsInNested{};
    }

    receive() {}
}