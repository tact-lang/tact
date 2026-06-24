struct MixedSerializationOptionals {
    a: Int as int64;
    b: Int? as uint32;
    c: Bool?;
}

contract TestContract {
    m: MixedSerializationOptionals;

    init() {
        self.m = MixedSerializationOptionals{
            a: 1,
            b: null,
            c: true,
        };
    }
}
