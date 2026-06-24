struct InnerOpt {
    a: Int;
}

struct OuterOpt {
    opt: InnerOpt?;
    m: map<Int, Int>;
}

contract TestOptionalMap {
    receive() {
        let o: OuterOpt = OuterOpt{
            opt: InnerOpt{ a: 42 },
            m: emptyMap()
        };
    }
}
