struct FieldsOrderA {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

struct FieldsOrderB {
    d: Address;
    c: String;
    b: Bool;
    a: Int;
}

contract Test {
    fa: FieldsOrderA;
    fb: FieldsOrderB;

    init() {
        self.fa = FieldsOrderA{a:1,b:true,c:"hi",d:myAddress()};
        self.fb = FieldsOrderB{a:1,b:true,c:"hi",d:myAddress()};
    }
}