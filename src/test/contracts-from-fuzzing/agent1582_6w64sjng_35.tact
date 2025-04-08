struct X1 { a: Int; }
struct X2 { a: X1; }
struct X3 { a: X2; }
struct X4 { a: X3; }
struct X5 { a: X4; }

contract VeryDeepStruct {
    root: X5;
    init() {
        self.root = X5{ a: X4{ a: X3{ a: X2{ a: X1{ a: 5 } } } } };
    }
}