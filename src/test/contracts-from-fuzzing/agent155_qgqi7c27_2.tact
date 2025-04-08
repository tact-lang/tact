struct InnerStruct {
    x: Int;
    y: Int;
    z: Int;
    flag: Bool;
}

contract LargeStructField {
    field: InnerStruct;

    init() {
        self.field = InnerStruct{x: 1,y:2,z:3,flag:true};
    }
}