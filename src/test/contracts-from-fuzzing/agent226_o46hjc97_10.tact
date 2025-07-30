struct StringOptionalNested {
    text: String?;
    inner: OptIntStruct;
}

struct OptIntStruct {
    val: Int?;
}

contract TestStringOpt {
    s: StringOptionalNested;

    init() {
        self.s = StringOptionalNested{
            text: null,
            inner: OptIntStruct{val: null}
        };
    }
}
