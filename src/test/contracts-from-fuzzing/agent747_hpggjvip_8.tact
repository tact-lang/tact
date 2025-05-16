struct Complex1 {
    i: Int;
    b: Bool;
    s: String;
}

struct Complex2 {
    c: Complex1;
    o: Complex1?;
}

contract TestContract {
    val: Complex2;

    init() {
        self.val = Complex2 {
            c: Complex1 {
                i: 1,
                b: false,
                s: "Hello",
            },
            o: null,
        };
    }
}