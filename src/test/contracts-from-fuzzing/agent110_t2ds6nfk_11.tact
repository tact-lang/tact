struct Complex {
    a: Int as int64;
    b: Int as uint32;
    c: String;
    d: Slice;
}

contract Serialization {
    val: Complex;
    init() {
        self.val = Complex{
            a: -5,
            b: 1000,
            c: "string",
            d: emptyCell().asSlice(),
        };
    }
}