struct NestedBool {
    f: Bool;
}

contract BoolContract {
    field: NestedBool;

    init() {
        self.field = NestedBool{ f: true };
    }
}