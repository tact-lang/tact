struct InnerOpt {
    X: Int;
}

struct OuterOpt {
    inner: InnerOpt?;
    M: map<Int, Int>;
}

contract TestOptionalMap {
    receive() {
        let a: OuterOpt = OuterOpt {
            inner: null,
            M: emptyMap()
        };
    }
}
