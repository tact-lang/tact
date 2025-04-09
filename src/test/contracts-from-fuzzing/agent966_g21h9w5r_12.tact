struct MixedSerialized {
    a: Int as uint16;
    b: Int? as uint32;
    c: Bool;
    d: Address?;
}

contract TestContract {
    val: MixedSerialized;

    init() {
        self.val = MixedSerialized{
            a: 42,
            b: null,
            c: true,
            d: null
        };
    }
}