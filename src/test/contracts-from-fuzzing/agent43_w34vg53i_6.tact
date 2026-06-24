struct InnerOpt {
    i: Int?;
}

struct MiddleOpt {
    inner: InnerOpt?;
}

struct OuterChain {
    middle: MiddleOpt?;
    value: Int;
}

contract OptionalChainContract {
    receive() {
        let o: OuterChain = OuterChain { middle: MiddleOpt { inner: InnerOpt { i: 42 } }, value: 100 };
        // Chaining non-null assertions to extract the optional value
        let res: Int = o.middle!!.inner!!.i!!;
        res;
    }
}
