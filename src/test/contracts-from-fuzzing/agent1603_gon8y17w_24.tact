struct PartialOptional {
    fixed: Int;
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract PartiallyOptionalStruct {
    data: PartialOptional;

    init() {
        self.data = PartialOptional{
            fixed: 42,
            opt1: null,
            opt2: false,
            opt3: null
        };
    }
}