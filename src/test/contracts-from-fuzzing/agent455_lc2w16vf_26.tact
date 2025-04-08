struct PackedInts {
    a: Int as uint3;
    b: Int as uint7;
    c: Int as int1;
    d: Int as int17;
}

contract SerializeOptTest {
    val: PackedInts;
    init() {
        self.val = PackedInts{
            a: 5,
            b: 100,
            c: -1,
            d: 12345,
        };
    }
}