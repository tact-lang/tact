struct Inner {
    flag: Bool;
    num: Int?;
    txt: String;
}

contract OptionalMixedFieldsTest {
    s: Inner;

    init() {
        self.s = Inner{
            flag: true,
            num: null,
            txt: "test"
        };
    }
}