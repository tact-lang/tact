struct RecursA {
    b: RecursB;
}

struct RecursB {
    c: Int;
}

contract RecursivePattern {
    d: RecursA;

    init() {
        self.d = RecursA{ b: RecursB{ c: 7 } };
    }
}