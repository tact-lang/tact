struct OptNested {
    inner: Int?;
}

contract OptionalFieldNullDefault {
    st: OptNested;

    init() {
        self.st = OptNested{ inner: null };
    }
}