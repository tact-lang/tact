struct SerializeMix {
    n1: Int;
    n2: Int as int64;
    n3: Int as uint8;
    flag: Bool;
}

contract StructMixContract {
    data: SerializeMix;

    init() {
        self.data = SerializeMix{
            n1:77,
            n2:88,
            n3:99,
            flag:true
        };
    }
}
