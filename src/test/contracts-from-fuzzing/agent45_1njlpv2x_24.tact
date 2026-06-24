struct RecursionTest1 {
    a: Int;
    b: RecursionTest2?;
}

struct RecursionTest2 {
    x: Bool;
}

contract NullableRecursiveStruct {
    rec: RecursionTest1;

    init() {
        self.rec = RecursionTest1{ a: 5, b: null };
    }
}
