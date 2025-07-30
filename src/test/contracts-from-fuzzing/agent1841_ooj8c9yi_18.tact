struct SFields {
    a: Int;
    b: Int;
}

contract AssignSoMany {
    s: SFields;

    init() {
        self.s = SFields{
            a: 5,
            b: 10
        };
        self.s = SFields{a:42,b:24};
    }
}
