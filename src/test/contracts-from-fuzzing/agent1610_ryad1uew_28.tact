struct InnerStruct {
    i: Int;
    b: Bool;
}

contract MixOptDefault {
    optInt: Int?;
    defInt: Int = 1;
    optStruct: InnerStruct?;
    regStruct: InnerStruct;

    init() {
        self.optInt = null;
        self.defInt = 2;
        self.optStruct = null;
        self.regStruct = InnerStruct{ i:5, b:true };
    }
}