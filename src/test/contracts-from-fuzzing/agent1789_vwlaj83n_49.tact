struct Inner1 {
    v: Int;
}

struct Inner2 {
    v: Bool;
}

contract MultiStructEmbedded {
    i1: Inner1;
    i2: Inner2;

    init() {
        self.i1 = Inner1{ v:1 };
        self.i2 = Inner2{ v:true };
    }
}