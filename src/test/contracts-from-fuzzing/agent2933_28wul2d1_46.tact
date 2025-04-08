struct SWithSer {
    a: Int as int64 = 1234;
    b: Int as uint8 = 100;
}

contract NestedSerializedDefaults {
    x: SWithSer = SWithSer{};
}