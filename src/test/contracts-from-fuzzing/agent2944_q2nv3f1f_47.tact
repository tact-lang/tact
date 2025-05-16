struct SubStruct {
    x: Int;
}

contract StructDefaultInit2 {
    s: SubStruct = SubStruct{x:0};

    init() {
        self.s = SubStruct{x: 99};
    }
}