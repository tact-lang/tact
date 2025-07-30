// contract with large number of direct persistent composite fields of structs, some optional
struct A { x: Int; y: Int?; }
struct B { s: String; b: Bool?; }
struct C { addr: Address; s: String?; }

contract ManyStructFields {
    a: A;
    b: B?;
    c: C;
    d: A?;
    e: B;
    f: C?;

    init() {
        self.a = A{ x:1, y:null };
        self.b = null;
        self.c = C{ addr: myAddress(), s: null };
        self.d = null;
        self.e = B{ s: "s", b: null };
        self.f = null;
    }
}