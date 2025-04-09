struct A { val: Int }

struct B {
    a: A;
    opt: Int?;
}

struct C {
    b: B;
    txt: String;
}

contract DiverseNested {
    c: C;
    init() {
        self.c = C{ b: B{ a: A{ val:5 }, opt:null }, txt:"hello" };
    }
}