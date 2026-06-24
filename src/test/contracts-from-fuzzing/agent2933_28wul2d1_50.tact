struct SWithSer {
    a: Int as int4 = 12;
    b: Int as uint3 = 9;
}

contract NestedSerializedDefaults {
    x: SWithSer = SWithSer{};
}