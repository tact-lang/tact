struct ManyDefaults2 {
    x: Int = 1;
    y: Bool = true;
    s: String = "abc";
}

struct Complex {
    n: Int;
    opt_str: String?;
    nested: ManyDefaults2;
}

contract NestedComplex {
    data: Complex;
    init() {
        self.data = Complex{
            n: 5,
            opt_str: "hello",
            nested: ManyDefaults2{}
        };
    }
}