struct FieldsManyTypes {
    i: Int;
    b: Bool;
    s: String;
    iopt: Int?;
    bopt: Bool?;
    sopt: String?;
}

contract DifferentFieldTypes {
    val: FieldsManyTypes;

    init() {
        self.val = FieldsManyTypes{
            i: 1,
            b: true,
            s: "hey",
            iopt: null,
            bopt: false,
            sopt: null,
        };
    }
}
