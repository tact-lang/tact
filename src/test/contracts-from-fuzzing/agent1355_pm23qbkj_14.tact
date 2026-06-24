struct SerializeMix {
    a: Int as uint4;
    b: Int as int32;
    c: Int;
}

contract SerializeContract {
    data: SerializeMix;

    init() {
        self.data = SerializeMix{
            a: 7,
            b: -1000,
            c: 9999
        };
    }
}