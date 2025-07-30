struct ConstStruct {
    x: Int;
    y: Bool;
}

contract ConstFields {
    const STRUCT_CONST: ConstStruct = ConstStruct{
        x: 123,
        y: true
    };
    
    field: Int;
    
    init() {
        self.field = self.STRUCT_CONST.x;
    }
}