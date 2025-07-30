struct Wrapped {
    val: Int;
    optVal: Int?;
}

contract Test {
    directInt: Int;
    optInt: Int?;
    structField: Wrapped;
    optStruct: Wrapped?;

    init() {
        self.directInt = 10;
        self.optInt = null;
        self.structField = Wrapped{ val:1,optVal:null };
        self.optStruct = null;
    }
}