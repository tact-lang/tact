struct Complex {
    n: Int;
    bOpt: Bool?;
    addrOpt: Address?;
    nestedOpt: Inner?;
}

struct Inner {
    val: Int;
}

contract NestedOptionalFields {
    c: Complex;

    init() {
        self.c = Complex{
            n: 1,
            bOpt: true,
            addrOpt: null,
            nestedOpt: null
        };
    }
}