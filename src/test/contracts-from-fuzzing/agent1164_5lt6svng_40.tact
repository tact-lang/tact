struct SingularOptional {
    s: String?;
}

contract NestedSOpt {
    field: SingularOptional;

    init() {
        self.field = SingularOptional{s: null};
    }
}