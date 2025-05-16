struct Packed {
    a: Int as uint8;
    b: Int as uint4;
    c: Int as uint1;
    d: Bool;
}

contract PackedTypesTest {
    packed: Packed;

    init() {
        self.packed = Packed{
            a: 5, b: 8, c: 1, d: true,
        };
    }
}