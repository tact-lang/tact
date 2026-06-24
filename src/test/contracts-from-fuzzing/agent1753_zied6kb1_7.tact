struct Base {
    flag1: Bool;
    flag2: Bool;
}

struct Mid1 {
    data: Base;
    number: Int;
}

struct Mid2 {
    info: Base;
    str: String;
}

struct Top {
    first: Mid1;
    second: Mid2;
}

contract WideNested {
    storage: Top;

    init() {
        self.storage = Top{
            first: Mid1{
                data: Base{flag1: true, flag2: false},
                number: 77
            },
            second: Mid2{
                info: Base{flag1: false, flag2: true},
                str: "wide"
            }
        };
    }
}