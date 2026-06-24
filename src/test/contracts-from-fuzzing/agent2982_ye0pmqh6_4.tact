struct OptInner {
    value: Int?;
    txt: String?;
}

contract OptionalFieldsTest {
    data: OptInner = OptInner{ value: null, txt: null };

    init() {
        self.data = OptInner{ value: 123, txt: "Opt" };
    }
}