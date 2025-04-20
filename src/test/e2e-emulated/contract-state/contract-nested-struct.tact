struct NestedDefaults {
    foo: Int = 1;
    inner: Inner = Inner {};
}

struct Inner {
    bar: Bool = false;
    text: String = "";
}

contract TestStorage {
    myVal: NestedDefaults;

    init() {
        self.myVal = NestedDefaults {};
    }

    receive() {}

    get fun val(): NestedDefaults { return self.myVal }
}
