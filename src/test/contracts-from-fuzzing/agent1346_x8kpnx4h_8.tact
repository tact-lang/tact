struct InnerStruct {
    x: Int;
    y: Int;
}

contract ArrayOfStructs {
    a1: InnerStruct;
    a2: InnerStruct;
    a3: InnerStruct;

    init() {
        self.a1 = InnerStruct{x:0, y:0};
        self.a2 = InnerStruct{x:1, y:1};
        self.a3 = InnerStruct{x:2, y:2};
    }
}