struct Compound1 {
    a: Int;
    b: Bool;
    c: Inner1;
}
struct Inner1 {
    d: String;
    e: Address;
}

struct Compound2 {
    x: Bool;
    y: Int;
    z: Inner2;
}
struct Inner2 {
    q: String;
    r: Address;
}

contract MultipleCompoundStructs {
    c1: Compound1;
    c2: Compound2;

    init() {
        self.c1 = Compound1{ a: 7, b: true, c: Inner1{ d: "str", e: myAddress() } };
        self.c2 = Compound2{ x: false, y: 9, z: Inner2{ q: "qstr", r: myAddress() } };
    }
}