struct MixSerialize {
    val1: Int as int8;
    val2: Int;
    val3: Int as uint32;
}

contract SerializeMix {
    data: MixSerialize;

    init() {
        self.data = MixSerialize{
            val1: -5,
            val2: 1000,
            val3: 50,
        };
    }
}
