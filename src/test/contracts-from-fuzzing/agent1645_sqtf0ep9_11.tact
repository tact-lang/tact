struct Complex2 {
    foo: Int;
    bar: String?;
}

struct Complex1 {
    c2: Complex2;
    optInt: Int?;
}

contract NestedOptionalsDeep {
    var: Complex1;

    init() {
        self.var = Complex1{
            c2: Complex2{ foo: 3, bar: null },
            optInt: null
        };
    }
}