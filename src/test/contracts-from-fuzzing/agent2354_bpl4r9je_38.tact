struct MixSerialize {
    a: Int as int16;
    b: Int? as int32;
    c: Bool?;
}

contract SerializationMix {
    data: MixSerialize;

    init() {
        self.data = MixSerialize{ a: 1, b: null, c: null };
    }
}