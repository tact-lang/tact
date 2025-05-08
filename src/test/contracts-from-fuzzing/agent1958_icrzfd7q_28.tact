struct Packed {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
    d: Bool;
}

contract PackedStorage {
    packed: Packed;

    init() {
        self.packed = Packed{
            a:255,
            b:30000,
            c:1_000_000,
            d:true
        };
    }
}
