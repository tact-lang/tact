struct OptNestedDefaults {
    f1: Int? = null;
    f2: Bool? = null;
    f3: String? = null;
    f4: Cell? = null;
    f5: Cell?;
}

contract TestContract {
    x: OptNestedDefaults;

    init() {
        self.x = OptNestedDefaults{ f5: null };
    }
}