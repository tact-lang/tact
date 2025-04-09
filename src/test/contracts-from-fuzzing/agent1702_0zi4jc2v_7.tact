struct B {
    f1: Int;
    f2: Bool;
    f3: Slice;
}

struct A {
    b1: B;
    b2: B;
    b3: B;
    label: String;
    code: Cell;
}

contract TestContract {
    a: A;

    init() {
        self.a = A{
            b1: B{f1: 1, f2: true, f3: emptyCell().asSlice()},
            b2: B{f1: 2, f2: false, f3: emptyCell().asSlice()},
            b3: B{f1: 3, f2: false, f3: emptyCell().asSlice()},
            label: "lbl",
            code: emptyCell(),
        };
    }
}