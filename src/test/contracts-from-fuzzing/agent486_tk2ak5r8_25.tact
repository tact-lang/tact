struct Complex {
    val: Int;
    optVal: Int?;
    nested: Nested;
    optNested: Nested?;
    addr: Address;
    optAddr: Address?;
    s: String;
    optS: String?;
}

struct Nested {
    a: Int;
    b: Bool;
}

contract TestComplex {
    d: Complex;

    init() {
        self.d = Complex{
            val: 1,
            optVal: null,
            nested: Nested{ a:2, b:true },
            optNested: null,
            addr: myAddress(),
            optAddr: null,
            s: "zz",
            optS: null
        };
    }
}