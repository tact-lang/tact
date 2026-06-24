struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
}

contract ManyOptionals {
    f1: OptionalStruct?;
    f2: Int?;
    f3: Bool?;
    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
    }
}