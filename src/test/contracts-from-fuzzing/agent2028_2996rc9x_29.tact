struct NestedOptDefault {
    flag: Bool? = null;
    label: String = "lbl";
}

contract UseNestedOptDefault {
    obj: NestedOptDefault;

    init() {
        self.obj = NestedOptDefault{};
    }
}
