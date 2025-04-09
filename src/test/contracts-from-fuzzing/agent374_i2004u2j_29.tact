// Persistent Int fields with mixed serialization
contract TestContract {
    i1: Int as uint8 = 1;
    i2: Int as int16 = -2;
    i3: Int as uint32 = 3;
    i4: Int as int64 = -4;
    i5: Int = 5;

    init() {}

    receive() {
        let _ = self.i4;
    }
}