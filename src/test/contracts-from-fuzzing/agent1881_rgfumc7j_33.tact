struct S {
    s: String?;
}

contract EmptyStringOpt {
    field: S;

    init() {
        self.field = S{ s: null };
    }
}