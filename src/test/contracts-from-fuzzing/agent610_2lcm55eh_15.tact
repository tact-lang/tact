struct FieldsOrder1 {
    a: Int;
    b: Bool;
    c: String;
}

struct FieldsOrder2 {
    c: String;
    b: Bool;
    a: Int;
}

contract FieldOrderDiff {
    f1: FieldsOrder1;
    f2: FieldsOrder2;

    init() {
        self.f1 = FieldsOrder1{a:1,b:true,c:"x"};
        self.f2 = FieldsOrder2{a:1,b:true,c:"x"};
    }
}