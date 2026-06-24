struct FieldsOrder {
    f1: Int = 1;
    f2: Bool = true;
    f3: String = "s";
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int as uint8 = 5;
    f8: Int as int64 = 6;
    f9: Int as coins = 7;
}

contract TestContract {
    foo: FieldsOrder = FieldsOrder{f4:null, f5:null, f6:null};

    init() {
        self.foo = FieldsOrder{f4:null, f5:null, f6:null};
    }

    receive() {
        dump(self.foo.f7);
    }
}