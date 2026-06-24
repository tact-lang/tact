struct BoolStruct {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract PackedBools {
    flags: BoolStruct;
    init() {
        self.flags = BoolStruct{ a:true, b:false, c:true };
    }
}