struct HasOptional {
    foo: Int?;
    bar: Bool?;
}

contract ManyOptionals {
    f1: Int?;
    f2: Int?;
    f3: Bool?;
    f4: Bool?;
    f5: Address?;
    f6: Cell?;
    f7: Slice?;
    f8: String?;
    nested: HasOptional?;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.f4 = null;
        self.f5 = null;
        self.f6 = null;
        self.f7 = null;
        self.f8 = null;
        self.nested = null;
    }
}