struct BigChain3 {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct WrapBigChain3 {
    inner: BigChain3;
    flag: Bool;
}

struct WrapWrapBigChain3 {
    wrapped: WrapBigChain3;
}

contract TripleWrapper {
    field: WrapWrapBigChain3;

    init() {
        self.field = WrapWrapBigChain3{
            wrapped: WrapBigChain3{
                inner: BigChain3{
                    f1: 1,
                    f2: true,
                    f3: "s",
                },
                flag: false,
            }
        };
    }
}