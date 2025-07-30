struct SerializeMix {
    a: Int as uint8;
    b: Int;
    c: Int as int16;
}

contract SerMix {
    s: SerializeMix;
    init() {
        self.s = SerializeMix{a:1,b:2,c:3};
    }
}