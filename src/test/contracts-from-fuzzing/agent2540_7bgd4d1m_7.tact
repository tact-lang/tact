struct OptionalNested {
    num: Int?;
    nested: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    comment: String;
}

contract OptionalNestTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            num: null,
            nested: null
        };
    }
}