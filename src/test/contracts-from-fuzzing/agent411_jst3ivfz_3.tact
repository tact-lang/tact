struct InnerS {
    f1: Int;
    f2: Bool;
    f3: Int?;
}

contract ManyFields {
    numField1: Int;
    numField2: Int;
    boolField: Bool;
    optField: Int?;
    structField: InnerS;

    init() {
        self.numField1 = 1;
        self.numField2 = 2;
        self.boolField = false;
        self.optField = null;
        self.structField = InnerS{ f1: 0, f2: true, f3: null };
    }
}