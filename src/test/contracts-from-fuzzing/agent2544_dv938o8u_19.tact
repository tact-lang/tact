struct S1 {
    flag: Bool;
    num: Int as uint16;
    text: String;
}

struct S2 {
    s1: S1;
    optionalNum: Int?;
    optionalStr: String?;
}

contract NestedOpts {
    data: S2;
    init() {
        self.data = S2{
            s1: S1{ flag: true, num: 11, text: "txt" },
            optionalNum: null,
            optionalStr: null
        };
    }
}