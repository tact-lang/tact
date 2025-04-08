struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

contract ManyStructFields {
    field1: S1;
    field2: S2;

    init() {
        self.field1 = S1{ a: 10 };
        self.field2 = S2{ b: 20 };
    }
}