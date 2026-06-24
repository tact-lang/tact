struct MultiStruct {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
}

contract MultiStructField {
    s1: MultiStruct;
    s2: MultiStruct;
    s3: MultiStruct;

    init() {
        self.s1 = MultiStruct{
            intVal: 1, boolVal: true, strVal: "a", addrVal: myAddress()
        };
        self.s2 = MultiStruct{
            intVal: 2, boolVal: false, strVal: "b", addrVal: myAddress()
        };
        self.s3 = MultiStruct{
            intVal: 3, boolVal: true, strVal: "c", addrVal: myAddress()
        };
    }
}