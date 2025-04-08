struct Complex {
    a: Int as uint4;           // small
    b: Int?;                  // optional int
    c: Bool;                  // bool
    d: Int as int64;          // medium
    e: Bool?;                 // optional bool
    f: Int as uint128;        // large
    g: Address;               // address (constant 267 bits)
    h: Bool;                  // bool
    i: Int;                   // full 257 int
    j: Int as int16;          // small
    k: Int?;                  // optional int
}

contract Test {
    val: Complex;

    init() {
        self.val = Complex{
            a: 8,
            b: null,
            c: false,
            d: -123456,
            e: true,
            f: 1234567891234512345678912345,
            g: myAddress(),
            h: true,
            i: -2,
            j: -12,
            k: null
        };
    }
}