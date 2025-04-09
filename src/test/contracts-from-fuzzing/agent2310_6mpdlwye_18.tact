struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

contract WithManyStructs {
    fa: A;
    fb: B?;
    fc: C;

    init() {
        self.fa = A{ a:1 };
        self.fb = null;
        self.fc = C{ c:2 };
    }
}