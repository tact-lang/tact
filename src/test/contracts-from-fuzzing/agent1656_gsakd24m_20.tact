struct OptionalDiff {
    foo: Int?;
    bar: Bool?;
}

contract SetSomeNull {
    data: OptionalDiff;

    init() {
        self.data = OptionalDiff { foo: 5, bar: null };
    }
}