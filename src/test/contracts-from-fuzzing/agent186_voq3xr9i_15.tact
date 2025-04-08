struct A1 {
    a: Int;
}

struct A2 {
    a: A1;
}

struct A3 {
    a: A2;
}

struct A4 {
    a: A3;
}

struct A5 {
    a: A4;
}

contract Chain {
    state: A5;

    init() {
        self.state = A5 { a: A4 { a: A3 { a: A2{ a: A1{ a: 1 } } } } };
    }
}