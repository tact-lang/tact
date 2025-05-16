struct OptBoolStruct {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
    b5: Bool?;
}

contract Test {
    s: OptBoolStruct = OptBoolStruct{b1:null,b2:null,b3:null,b4:null,b5:null};
    init() {
        self.s = OptBoolStruct{b1:true,b2:false,b3:true,b4:false,b5:true};
    }
}