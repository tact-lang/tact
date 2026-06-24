struct SInner {
    a: Int;
    b: Bool;
}

struct SMiddle {
    s: SInner;
    opt: Int?;
}

struct SOuter {
    mid: SMiddle;
    str: String;
    flag: Bool;
}

contract ComplexNested {
    data: SOuter;

    init() {
        self.data = SOuter{
            mid: SMiddle{
                s: SInner{
                    a: 111,
                    b: false,
                },
                opt: 222,
            },
            str: "hello",
            flag: true,
        };
    }
}