struct A { val: Int; }
struct B { flag: Bool; }
struct C { ref: Cell; }

contract MultiStructs {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{ val: 5 };
        self.b = B{ flag: true };
        self.c = C{ ref: emptyCell() };
    }
}