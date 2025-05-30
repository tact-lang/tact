// Optional Int serialized as uint8
contract OptionalUint8 {
    n: Int? as uint8;

    init() {
        self.n = null;
    }
}