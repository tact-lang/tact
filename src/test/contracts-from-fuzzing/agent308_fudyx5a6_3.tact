struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Bool?;
    f6: String;
    f7: Int;
    f8: Int;
    f9: Bool;
    f10: String;
}

contract LotsOfFields {
    persist: ManyFields;

    init() {
        self.persist = ManyFields{
            f1:1, f2:true, f3:"a", f4:emptyCell(), f5:null,
            f6:"b", f7:2, f8:3, f9:false, f10:"c",
        };
    }
}
