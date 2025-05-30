struct InnerDeep {
    d: Int;
}

struct MiddleDeep {
    m: InnerDeep;
}

struct OuterDeep {
    o: MiddleDeep;
}

contract DeepChain {
    value: OuterDeep = OuterDeep{ o: MiddleDeep{ m: InnerDeep{ d: 42 } } };
}