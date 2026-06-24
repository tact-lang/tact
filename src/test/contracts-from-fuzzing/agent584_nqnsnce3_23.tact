struct SerializeTest {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int1;
    d: Int as uint4;
}

contract Test {
    s: SerializeTest = SerializeTest{ a: 10, b: 20, c: 0, d: 5 };
}