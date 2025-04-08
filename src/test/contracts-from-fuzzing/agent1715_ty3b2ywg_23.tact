struct Serialized {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint128;
}

contract TestContract {
    s: Serialized = Serialized{
        a: 1234567,
        b: -1234567890,
        c: 42
    };
}