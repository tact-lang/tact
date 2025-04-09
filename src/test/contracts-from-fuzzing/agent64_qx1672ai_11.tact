struct SStruct {
    s: String;
    addr: Address;
    coin: Int;
    flag: Bool?;
}

contract Test11 {
    a: SStruct;
    b: SStruct;
    c: SStruct;

    init() {
        self.a = SStruct{s:"A", addr:myAddress(), coin:1, flag:null};
        self.b = SStruct{s:"B", addr:myAddress(), coin:2, flag:true};
        self.c = SStruct{s:"C", addr:myAddress(), coin:3, flag:false};
    }
}