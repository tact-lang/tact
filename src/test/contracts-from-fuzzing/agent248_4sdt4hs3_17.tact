struct NestedDefaults {
    inner: Inner;
}

struct Inner {
    x: Int = 10;
    y: String = "abc";
}

contract TestContract {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{ inner: Inner{} };
    }
}