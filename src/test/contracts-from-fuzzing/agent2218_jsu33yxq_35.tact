struct OptionalInStruct {
    x: Int?;
}

contract DirectOpt {
    o1: OptionalInStruct;
    o2: OptionalInStruct;

    init() {
        self.o1 = OptionalInStruct{x:null};
        self.o2 = OptionalInStruct{x:123};
    }
}