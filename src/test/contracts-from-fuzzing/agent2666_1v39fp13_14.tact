struct OptionalNested {
    flag: Bool?;
    note: String?;
}

struct PartlyOptional {
    mainValue: Int;
    nested: OptionalNested?;
}

contract OptionalComplex {
    val: PartlyOptional;

    init() {
        self.val = PartlyOptional{
            mainValue: 5,
            nested: null,
        };
    }
}