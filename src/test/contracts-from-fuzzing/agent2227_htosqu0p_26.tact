struct DeepStruct {
    x: Int;
}

struct MiddleStruct {
    d: DeepStruct;
}

struct OuterStruct {
    m: MiddleStruct;
}

contract ParamsWithNested(
    field: OuterStruct,
) {}