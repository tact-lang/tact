struct InnerS {
    a: Int;
    b: Int;
}

contract ManyStructFields {
    field1: InnerS;
    field2: InnerS;
    field3: InnerS;

    init() {
        self.field1 = InnerS{ a:1, b:1 };
        self.field2 = InnerS{ a:2, b:2 };
        self.field3 = InnerS{ a:3, b:3 };
    }
}