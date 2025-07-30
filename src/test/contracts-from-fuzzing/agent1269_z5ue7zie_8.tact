struct DeepComplex {
    a: Int;
    b: Bool?;
    c: String;
}

struct MoreComplex {
    d: DeepComplex;
    e: Int?;
    f: String;
}

struct VeryComplex {
    g: MoreComplex;
    h: MoreComplex?;
    i: Bool;
}

contract TestContract {
    nested: VeryComplex;

    init() {
        self.nested = VeryComplex{
            g: MoreComplex{
                d: DeepComplex{a:1, b:true, c:"x"},
                e: null,
                f: "hey"
            },
            h: null,
            i: false
        };
    }
}