struct Complex1 {
    val1: Int;
    opt1: String?;
}

struct Complex2 {
    inner1: Complex1;
    opt2: Complex1?;
    s: String;
}

contract StructOptionals {
    f: Complex2;

    init() {
        self.f = Complex2{
            inner1: Complex1{ val1: 10, opt1: null },
            opt2: null,
            s: "ok"
        };
    }
}
