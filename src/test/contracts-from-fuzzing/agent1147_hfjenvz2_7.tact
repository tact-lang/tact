struct OptionalStruct {
    innerStr: String?;
    boolVal: Bool?;
    numVal: Int?;
}

contract TestContract {
    f1: Int;
    f2: OptionalStruct;
    f3: Bool;

    init() {
        self.f1 = 5;
        self.f2 = OptionalStruct{
            innerStr: null,
            boolVal: true,
            numVal: null,
        };
        self.f3 = false;
    }
}