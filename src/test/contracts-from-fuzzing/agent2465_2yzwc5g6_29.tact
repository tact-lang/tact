// Combination of nested struct + many primitive fields
struct S1 {
    x: Int;
    y: Bool;
    s: String;
}

struct S2 {
    inner: S1;
    a: Int;
    b: String;
    c: Bool;
}

contract TestContract {
    rec: S2;
    init() {
        self.rec = S2{
            inner: S1{ x:1, y:true, s:"x" },
            a: 42,
            b: "ok",
            c: false
        };
    }
}