struct OptionalInner {
    val: Int;
}

struct OuterOpt {
    maybe: OptionalInner?;
    a: Int;
}

contract TestOptionalNested {
    receive() {
        let o1: OuterOpt = OuterOpt { maybe: OptionalInner { val: 55 }, a: 100 };
        let o2: OuterOpt = OuterOpt { maybe: null, a: 50 };
    }
}
