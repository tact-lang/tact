struct Complex1 {
    a: Int;
    b: String?;
    c: Bool;
}

struct Complex2 {
    inner: Complex1;
    s: String;
    f: Bool?;
}

contract DeepMixed {
    foo: Complex2;

    init() {
        self.foo = Complex2{
            inner: Complex1{a:9, b:null, c:true},
            s:"hi",
            f:false
        };
    }

    receive() {}
}