struct NestedOptDefault {
    num: Int? = null;
}

contract UseNestedOptDefault {
    f: NestedOptDefault;

    init() {
        self.f = NestedOptDefault{};
    }
}