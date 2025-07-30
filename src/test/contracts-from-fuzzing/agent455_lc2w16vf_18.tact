struct NestedBoolDefault {
    flag: Bool = false;
    inner: InnerDefault;
}

struct InnerDefault {
    val: Int = 100;
    isOk: Bool = true;
}

contract NestedDefaults {
    data: NestedBoolDefault;

    init() {
        self.data = NestedBoolDefault{
            inner: InnerDefault{},
        };
    }
}