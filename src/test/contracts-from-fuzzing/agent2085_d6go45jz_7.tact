struct IntsSizeTest {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
}

contract TestContract {
    data: IntsSizeTest;

    init() {
        self.data = IntsSizeTest{
            a: 8, b: -4, c: 65535, d: -2000000000, e: 18446744073709551615
        };
    }
}