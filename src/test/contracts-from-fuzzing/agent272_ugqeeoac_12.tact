struct StructBool {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
}

contract BoolMany {
    s: StructBool;

    init() {
        self.s = StructBool{
            b1:true, b2:false, b3:true, b4:false
        };
    }
}