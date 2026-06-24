struct OuterMost {
    middle: MiddleStruct;
}
struct MiddleStruct {
    inner: Innermost;
}
struct Innermost {
    i: Int;
    b: Bool;
}

contract DeepChain {
    d: OuterMost;

    init() {
        self.d = OuterMost{
            middle: MiddleStruct{
                inner: Innermost{ i: 7, b: true },
            },
        };
    }
}