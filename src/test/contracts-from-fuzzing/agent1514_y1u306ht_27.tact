struct BoolStruct {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
}

contract Test {
    s: BoolStruct = BoolStruct{b1:true,b2:false,b3:true,b4:false,b5:true};
    init() {
        self.s = BoolStruct{b1:false,b2:true,b3:false,b4:true,b5:false};
    }
}