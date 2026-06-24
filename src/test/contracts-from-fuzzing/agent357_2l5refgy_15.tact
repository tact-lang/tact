struct NestedEmptyDefaults {
    a: Int? = null;
    b: Bool? = null;
}

contract TestContract {
    st: NestedEmptyDefaults;

    init() {
        self.st = NestedEmptyDefaults{ a:null, b:null };
    }
}