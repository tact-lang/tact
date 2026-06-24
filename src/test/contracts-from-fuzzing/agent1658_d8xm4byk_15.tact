struct StringsNested {
    innerStr: String;
    optInnerStr: String?;
}

struct Wrap {
    a: StringsNested;
    b: StringsNested?;
}

contract StorageTest {
    data: Wrap;

    init() {
        self.data = Wrap{
            a: StringsNested{ innerStr: "A", optInnerStr: null },
            b: null
        };
    }
}