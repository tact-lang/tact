struct BigNested1 {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct BigNested2 {
    sub: BigNested1;
    f4: Int;
    f5: String?;
}

struct BigNested3 {
    sn: BigNested2;
    f6: Int;
    f7: Bool;
    f8: String;
}

contract BigNestedCombo {
    data: BigNested3;

    init() {
        self.data = BigNested3{
            sn: BigNested2{
                sub: BigNested1{
                    f1: 1234,
                    f2: false,
                    f3: "hey"
                },
                f4: 5678,
                f5: null
            },
            f6: 888,
            f7: true,
            f8: "yo"
        };
    }
}