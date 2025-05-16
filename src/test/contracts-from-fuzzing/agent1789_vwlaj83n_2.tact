struct BigNested {
    nested1: Int;
    nested2: Bool;
    nested3: String;
    nested4: String?;
    nested5: Int?;
    nested6: Bool?;
    nested7: String;
    nested8: Int;
}

contract ManyFieldsNested {
    data: BigNested;

    init() {
        self.data = BigNested{
            nested1: 1,
            nested2: true,
            nested3: "abc",
            nested4: null,
            nested5: null,
            nested6: null,
            nested7: "def",
            nested8: 42
        };
    }
}