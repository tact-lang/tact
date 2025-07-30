struct WrapOptBool {
    b: Bool?;
}

contract OptBoolInStruct {
    data: WrapOptBool;
    init(){
        self.data = WrapOptBool{b:null};
    }
}