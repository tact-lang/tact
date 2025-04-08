struct S {
    field: Int;
}

contract OptionalAssignments {
    s: S?;

    init() {
        self.s = null;
        self.s = S{ field: 42 };
        self.s = null;
    }
}