struct SNest { f: Int; }

contract NestedManyFields {
    f1: Int;
    f2: Bool;
    f3: SNest;
    f4: String;
    f5: Int?;
    f6: Bool?;
    f7: SNest;
    f8: String;
    f9: Int;
    f10: Bool;
    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = SNest{ f: 2 };
        self.f4 = "hi";
        self.f5 = null;
        self.f6 = null;
        self.f7 = SNest{ f: 3 };
        self.f8 = "there";
        self.f9 = 9;
        self.f10 = true;
    }
}