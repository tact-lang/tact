struct TupleTest {
    a: Int;
    b: Bool;
    c: String;
}

contract TupleFields {
    field1: TupleTest;
    field2: TupleTest;
    field3: TupleTest;

    init() {
        self.field1 = TupleTest{ a: 1, b: true, c: "one" };
        self.field2 = TupleTest{ a: 2, b: false, c: "two" };
        self.field3 = TupleTest{ a: 3, b: true, c: "three" };
    }
}