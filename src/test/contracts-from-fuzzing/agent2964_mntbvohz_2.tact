struct NestedWithDefaults {
    inner: InnerDefaults;
}

struct InnerDefaults {
    flag: Bool = false;
    val: Int = 123;
    text: String = "hello";
}

contract DefaultsNested {
    data: NestedWithDefaults;

    init() {
        self.data = NestedWithDefaults{
            inner: InnerDefaults{} // should pick defaults
        };
    }
}