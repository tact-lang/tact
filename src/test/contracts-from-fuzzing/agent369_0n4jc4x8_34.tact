struct MixingSerialized {
    small: Int as int8;
    normal: Int;
    large: Int as int257;
}

contract SerializeMixTest {
    s: MixingSerialized;

    init() {
        self.s = MixingSerialized{
            small: 1,
            normal: 2,
            large: 3,
        };
    }
}