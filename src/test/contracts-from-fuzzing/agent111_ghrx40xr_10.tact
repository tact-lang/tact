// Many optional fields with serialization hints
struct Complex {
    a: Int as uint32;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Cell?;
}

contract OptSerialize {
    val: Complex;
    init() {
        self.val = Complex{
            a: 123,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}