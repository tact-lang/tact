struct OptionalInner {
    val: Int?;
}

struct OuterParam {
    inner: OptionalInner?;
    flag: Bool?;
    name: String?;
}

contract NullableParamWrap(
    p: OuterParam? 
) {}
