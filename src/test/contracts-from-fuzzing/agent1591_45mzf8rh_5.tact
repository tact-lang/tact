struct InnerDeep {
    val1: Int;
    val2: Int;
}

struct MiddleDeep {
    inner: InnerDeep;
    opt: Bool?;
}

struct OuterDeep {
    middle: MiddleDeep;
    str: String;
    addr: Address;
    flag: Bool;
}

contract DeepNested {
    st: OuterDeep;

    init() {
        self.st = OuterDeep{
            middle: MiddleDeep{
                inner: InnerDeep{val1: 10, val2: 20},
                opt: true
            },
            str: "hello",
            addr: myAddress(),
            flag: false
        };
    }
}