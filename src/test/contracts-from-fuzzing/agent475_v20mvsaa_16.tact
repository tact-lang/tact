struct Complex1 {
    a: Int;
    b: Int?;
}

struct Complex2 {
    c: Complex1?;
    d: Bool;
}

struct Complex3 {
    e: Complex2;
    f: String;
}

contract TestContract {
    data: Complex3;

    init() {
        self.data = Complex3{
            e: Complex2{
                c: Complex1{a:1, b:null},
                d: true
            },
            f: "abc"
        };
    }

    receive() {}
}