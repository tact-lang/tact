struct Complex {
    a: Int;
    b: Bool?;
    c: Nested1;
}

struct Nested1 {
    d: Int?;
    e: Nested2;
}

struct Nested2 {
    f: Bool;
    g: String?;
}

contract ComplexStructContract {
    data: Complex;

    init() {
        self.data = Complex{
            a: 1,
            b: null,
            c: Nested1{
                d: null,
                e: Nested2{
                    f: true,
                    g: null
                }
            }
        };
    }
}