struct NestedWithDefault {
    a: Int = 1;
    b: String = "b";
}

contract NestedWithDefaultField {
    f: NestedWithDefault;

    init() {
        self.f = NestedWithDefault{};
    }
}