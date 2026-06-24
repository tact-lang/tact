struct A {
    v: Int;
}

contract OrderTest {
    field1: Int;
    field2: A;
    field3: Int;

    init() {
        self.field1 = 1;
        self.field2 = A{ v: 2 };
        self.field3 = 3;
    }
}
