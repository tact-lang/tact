// Now test struct inlining primitives
struct InlinedPrims {
    int1: Int;
    bool1: Bool;
    str1: String;
}

contract InlinePrimStructs {
    s: InlinedPrims;

    init() {
        self.s = InlinedPrims{
            int1: 42,
            bool1: true,
            str1: "test"
        };
    }
}
