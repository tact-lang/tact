struct DeepOne {
    x: Int;
}

struct WrapsOne {
    one: DeepOne;
    s: String;
}

contract LongChainParam(
    param: WrapsOne,
) {}