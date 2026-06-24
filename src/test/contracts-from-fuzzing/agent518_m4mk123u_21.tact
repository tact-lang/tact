struct NestedIn {
    u: Int as uint8;
    v: String? = "xx";
}

struct Complex {
    a: Int?;
    b: Bool = false;
    c: NestedIn?;
    d: String;
}

contract UltimateTest {
    data: Complex;

    init() {
        self.data = Complex{
            a: null,
            b: true,
            c: null,
            d: "done",
        };
    }
}