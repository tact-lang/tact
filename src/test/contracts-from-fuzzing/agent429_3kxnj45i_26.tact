struct BoolStruct {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
}

contract BoolPacked {
    bs: BoolStruct;
    init() {
        self.bs = BoolStruct{
            b1:true,b2:false,b3:true,b4:false
        };
    }
}
