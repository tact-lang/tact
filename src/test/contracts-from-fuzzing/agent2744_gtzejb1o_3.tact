struct ManyFields {
    f01: Int;
    f02: Int;
    f03: Int;
    f04: Int;
    f05: Int;
    f06: Int;
    f07: Int;
    f08: Int;
    f09: Int;
    f10: Int;
}

contract WideStructContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f01: 1,
            f02: 2,
            f03: 3,
            f04: 4,
            f05: 5,
            f06: 6,
            f07: 7,
            f08: 8,
            f09: 9,
            f10: 10
        };
    }
}
