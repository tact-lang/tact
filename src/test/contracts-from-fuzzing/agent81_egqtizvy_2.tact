struct NestedOptional {
    fld1: Int?;
    fld2: Bool?;
    fld3: String?;
}

contract UsesNestedOptional {
    myField: NestedOptional;

    init() {
        self.myField = NestedOptional{
            fld1: 12,
            fld2: true,
            fld3: "abc"
        };
    }
}