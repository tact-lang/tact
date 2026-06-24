struct InnerA {
    msg: String?;
    code: Int;
}

struct InnerB {
    flag: Bool?;
    value: Int?;
}

struct MidStruct {
    subA: InnerA?;
    subB: InnerB;
}

contract TestContract {
    first: MidStruct;
    second: InnerA?;
    third: InnerB;

    init() {
        self.first = MidStruct{
            subA: InnerA{
                msg: "hi",
                code: 111,
            },
            subB: InnerB{
                flag: true,
                value: 42,
            },
        };
        self.second = InnerA{
            msg: null,
            code: 0,
        };
        self.third = InnerB{
            flag: null,
            value: null,
        };
    }
}
