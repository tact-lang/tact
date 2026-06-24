struct InnerStruct {
    x: Int;
    y: Int;
}

contract Test {
    point: InnerStruct;

    init() {
        self.point = InnerStruct{x:1,y:2};
    }
}