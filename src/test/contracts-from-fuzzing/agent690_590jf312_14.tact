struct Ser {
    a: Int as uint4;
    b: Int as uint32;
    c: Int as int128;
    d: Int;
}

contract Serializers {
    field: Ser;

    init() {
        self.field = Ser{
            a: 3,
            b: 50,
            c: -100,
            d: 12345
        };
    }
}