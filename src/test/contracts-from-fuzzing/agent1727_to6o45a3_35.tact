// test override of default value of nested struct persistent var inside init()
struct Inner {
    foo: Int = 1;
    bar: Bool = false;
}

contract OverrideNestedDefault {
    data: Inner = Inner{};

    init() {
        self.data = Inner{foo: 99, bar: true};
    }

    receive() {}
}