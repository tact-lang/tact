struct Base {
    a: Int;
}

struct Mid {
    base: Base;
    b: Bool?;
}

struct Complex {
    mid: Mid;
    c: String?;
    d: Address;
}

contract TestContract {
    val: Complex;

    init() {
        self.val = Complex{
            mid: Mid{
                base: Base{ a:0 },
                b: null
            },
            c: null,
            d: myAddress()
        };
    }
}