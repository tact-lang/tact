// test contract persistent field with nested struct that uses serialization hints and optionals
struct SerOptInner {
    a: Int as uint8;
    b: Bool?;
    c: Int? as uint16;
}

contract PersistSerOpt {
    val: SerOptInner;

    init() {
        self.val = SerOptInner{a: 255, b: null, c: null};
    }
}