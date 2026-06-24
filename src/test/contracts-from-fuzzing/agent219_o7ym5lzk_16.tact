struct X1 { a: Int; }
struct X2 { a: Int; }
struct X3 { a: Int; }
struct X4 { a: Int; }
struct X5 { a: Int; }

struct ManyNested {
    f1: X1;
    f2: X2;
    f3: X3;
    f4: X4;
    f5: X5;
}

contract LargeNestedStruct {
    store: ManyNested;

    init() {
        self.store = ManyNested{
            f1: X1{ a: 1 },
            f2: X2{ a: 2 },
            f3: X3{ a: 3 },
            f4: X4{ a: 4 },
            f5: X5{ a: 5 }
        };
    }
}