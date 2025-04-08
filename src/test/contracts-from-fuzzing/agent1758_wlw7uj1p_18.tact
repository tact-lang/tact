struct Tiny {
    a: Bool;
    b: Int as int8;
    c: Int as uint4;
    d: Bool;
}

contract StorageTest {
    values: Tiny;

    init() {
        self.values = Tiny{
            a: true,
            b: -7,
            c: 10,
            d: false
        };
    }
}