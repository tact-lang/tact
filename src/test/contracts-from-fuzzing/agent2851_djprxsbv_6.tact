struct OptionalNested {
    inner: Int?;
    flag: Bool?;
}

contract OptionalStruct {
    data: OptionalNested?;

    init() {
        self.data = null;
    }
}
