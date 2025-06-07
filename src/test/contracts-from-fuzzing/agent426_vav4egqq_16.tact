struct InnerStruct {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
}

contract TestContract {
    s1: InnerStruct;
    s2: InnerStruct;
    s3: InnerStruct;

    init() {
        self.s1 = InnerStruct{ intVal: 1, boolVal: true, addrVal: myAddress() };
        self.s2 = InnerStruct{ intVal: 2, boolVal: false, addrVal: myAddress() };
        self.s3 = InnerStruct{ intVal: 3, boolVal: true, addrVal: myAddress() };
    }
}