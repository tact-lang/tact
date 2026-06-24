struct NestedWithSerialization {
    a: Int as uint8;
    b: Int;
    c: Int? as int16;
    d: Bool?;
}

contract NestedSerializeContract {
    data: NestedWithSerialization = NestedWithSerialization{
        a: 1,
        b: 2,
        c: null,
        d: null
    };
}