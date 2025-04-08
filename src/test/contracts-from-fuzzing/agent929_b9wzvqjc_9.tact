struct BigNested {
    n1: Int;
    n2: Int;
    n3: Bool;
    n4: String;
    n5: Address;
    n6: Cell;
    n7: Int?;
    n8: Bool?;
    n9: String?;
    n10: Address?;
    n11: Cell?;
}

contract DeepPersistent {
    nest: BigNested;
    init() {
        self.nest = BigNested{
            n1:1,
            n2:2,
            n3:true,
            n4:"x",
            n5:myAddress(),
            n6:emptyCell(),
            n7:null,
            n8:null,
            n9:null,
            n10:null,
            n11:null
        };
    }
}