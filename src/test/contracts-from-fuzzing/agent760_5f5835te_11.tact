struct InnerMost {
    z: Int;
}

message(13) MiddleMsg {
    inner: InnerMost;
    comment: String;
}

struct OuterStruct {
    mm: MiddleMsg;
    flag: Bool;
}

contract ComplexNest {
    complex: OuterStruct;

    init() {
        self.complex = OuterStruct{
            mm: MiddleMsg{
                inner: InnerMost{
                    z: 777,
                },
                comment: "deep",
            },
            flag: true,
        };
    }
}