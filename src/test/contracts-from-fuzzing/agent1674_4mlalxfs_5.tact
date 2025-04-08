struct OptionalNested {
    inner: Int?;
    flag: Bool;
}

struct TopLevel {
    nested: OptionalNested?;
    val: Int;
}

contract OptInStruct {
    data: TopLevel;

    init() {
        self.data = TopLevel{ nested: null, val: 42 };
    }
}