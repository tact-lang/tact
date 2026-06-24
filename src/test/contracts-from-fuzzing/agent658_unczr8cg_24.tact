struct C1 {
    a: Int;
}

struct C2 {
    a: C1;
}

struct C3 {
    a: C2;
}

struct C4 {
    a: C3;
}

struct C5 {
    a: C4;
}

contract Chain5 {
    c: C5;

    init() {
        self.c = C5{ a:C4{ a:C3{ a:C2{ a:C1{a:5} } } } };
    }
}