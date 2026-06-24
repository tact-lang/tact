struct InnerSer {
    foo: Int as int16;
    bar: Int? as uint8;
}

struct OuterNested {
    first: InnerSer;
    second: InnerSer?;
}

contract CrazyMix {
    data: OuterNested = OuterNested {
        first: InnerSer{ foo: 7, bar: null },
        second: null
    };

    init() {}
}