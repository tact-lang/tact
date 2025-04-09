struct OptionalStruct {
    s: String?;
    n: Int?;
    b: Bool?;
}

contract OptionalStructField {
    inner: OptionalStruct;

    init() {
        self.inner = OptionalStruct{
            s: null,
            n: null,
            b: null
        };
    }
}