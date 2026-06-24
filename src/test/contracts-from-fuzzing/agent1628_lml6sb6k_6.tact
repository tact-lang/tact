struct ListA {
    a1: Int;
    a2: String;
    a3: Bool;
}

struct ListB {
    b1: String;
    b2: Bool;
    b3: Int;
}

contract MultiStructFieldsContract {
    field1: ListA;
    field2: ListB;

    init() {
        self.field1 = ListA{ a1:1, a2:"x", a3:true };
        self.field2 = ListB{ b1:"y", b2:false, b3:2 };
    }
}