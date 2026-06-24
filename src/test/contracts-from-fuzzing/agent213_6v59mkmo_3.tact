struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Address;
    f6: Int?;
    f7: Bool?;
    f8: String;
    f9: Int;
    f10: Bool;
}

contract TestContract {
    mf: ManyFields;
    
    init() {
        self.mf = ManyFields{
            f1:1, f2:true, f3:"abc", f4:emptyCell(), f5:myAddress(),
            f6:null, f7:null, f8:"def", f9:9, f10:false
        };
    }
}