struct NestedDefaults {
    val: Int = 7;
    flag: Bool = false;
    txt: String = "abc";
}

struct Wrapping {
    inner: NestedDefaults;
    extra: Int;
}

contract NestedDefaultsContract {
    data: Wrapping;

    init() {
        self.data = Wrapping{
            inner: NestedDefaults{},
            extra: 42,
        };
    }
}
