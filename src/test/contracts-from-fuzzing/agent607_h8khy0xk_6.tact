struct InnerNested {
    val1: Int;
    val2: String;
    optionalVal: Bool?;
}

struct MidNested {
    inner: InnerNested;
    flag: Bool;
}

struct Outer {
    mid: MidNested;
    message: String;
}

contract ComplexNested {
    data: Outer;

    init() {
        self.data = Outer{
            mid: MidNested{
                inner: InnerNested{ val1: 77, val2: "hi", optionalVal: null },
                flag: true
            },
            message: "hello"
        };
    }
}