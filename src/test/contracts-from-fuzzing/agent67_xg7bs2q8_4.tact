struct OptionalNested {
    inner: Int?;
    flag: Bool?;
}

contract OptionalStructFields {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ inner: null, flag: true };
    }
}
