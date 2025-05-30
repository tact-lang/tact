struct InnerStruct {
    a: Int;
    b: Bool;
    c: String?;
}

contract MultiTypeFields {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: String;
    field5: InnerStruct;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = myAddress();
        self.field4 = "hello";
        self.field5 = InnerStruct{ a: 1, b: false, c: null };
    }
}