struct OptionalNested {
    inner: Int?;
}

contract OptStruct {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ inner: null };
    }
}