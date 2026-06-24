struct ManyFields {
    f1: Int; f2: Int; f3: Int; f4: Bool; f5: String; f6: Address;
    f7: Bool; f8: Int; f9: String;
}

contract MultiFieldPersist {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1:1, f2:2, f3:3, f4:true, f5:"hi", f6:myAddress(),
            f7:false, f8:8, f9:"bye"
        };
    }
}