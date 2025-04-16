struct OptionalNested {
    inner: Int?;
    str: String;
}

contract OptionalStruct {
    data: OptionalNested?;

    init() {
        self.data = null;
    }
}