struct NestedWithDefault {
    k: Int;
    note: String = "abc";
}

contract UseNestedWithDefault {
    inner: NestedWithDefault;

    init() {
        self.inner = NestedWithDefault{
            k: 77,
        };
    }
}
