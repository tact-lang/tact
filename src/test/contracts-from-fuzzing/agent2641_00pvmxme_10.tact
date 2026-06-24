struct NestedDefaults {
    inner: FewDefaults;
    num: Int = 10;
}

contract NestedWithDefaults {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{
            inner: FewDefaults{},
        };
    }
}

struct FewDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
}