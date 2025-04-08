// Test with field serialization as intN types
struct SignedSerialized {
    a: Int as int8;
    b: Int as int16;
    c: Int as int32;
    d: Int as int64;
}

contract TestContract {
    s: SignedSerialized;

    init() {
        self.s = SignedSerialized{a: -1, b: -2, c: -3, d: -4};
    }

    receive() {
        let _ = self.s.d;
    }
}