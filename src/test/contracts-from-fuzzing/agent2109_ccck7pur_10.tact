struct Packed {
    a: Int as uint8;
    b: Int as uint8;
    c: Int as uint8;
    d: Int as uint8;
    e: Int as uint8;
}

contract PackedFields {
    packed: Packed;

    init() {
        self.packed = Packed{a:1,b:2,c:3,d:4,e:5};
    }
}