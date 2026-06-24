struct NestedMany {
    inner1: Int;
    inner2: Bool;
    inner3: String;
    innerOpt: Int?;
}

struct WrapMany {
    nested: NestedMany;
    val: String?;
}

contract MixedDeepStruct {
    wrap: WrapMany = WrapMany{
        nested: NestedMany{
            inner1: 5,
            inner2: true,
            inner3: "abc",
            innerOpt: null,
        },
        val: null,
    };

    receive() {}
}