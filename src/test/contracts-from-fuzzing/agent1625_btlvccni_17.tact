struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

struct Combo {
    x: A?;
    y: B?;
    z: C?;
}

contract OptionalMany {
    info: Combo;

    init() {
        self.info = Combo{ x:null, y:null, z:null };
    }
}
