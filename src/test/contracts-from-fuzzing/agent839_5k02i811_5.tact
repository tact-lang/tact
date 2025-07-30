struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

contract OptWithStructs {
    field1: S1?;
    field2: S2?;
    init() {
        self.field1 = null;
        self.field2 = null;
    }
}