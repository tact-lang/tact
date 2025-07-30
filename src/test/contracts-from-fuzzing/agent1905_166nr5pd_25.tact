struct StringOptionalStruct {
    s: String?;
}

contract StringOptionalTest {
    v: StringOptionalStruct;

    init() {
        self.v = StringOptionalStruct{
            s: null,
        };
    }
}