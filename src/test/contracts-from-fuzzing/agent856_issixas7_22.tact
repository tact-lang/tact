struct Complex1 {
    a: Int;
    b: Bool;
}
struct Complex2 {
    k: Complex1;
    s: String;
}
struct Complex3 {
    m: Complex1;
    n: Complex2;
}

contract ComboNested {
    val: Complex3;

    init() {
        self.val = Complex3{
            m: Complex1{ a:1, b:true },
            n: Complex2{
                k: Complex1{ a:2, b:false },
                s: "hi"
            }
        };
    }
}