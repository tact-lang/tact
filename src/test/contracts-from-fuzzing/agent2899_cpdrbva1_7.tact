struct BigNested {
    x1: Int; x2: Int; x3: Int; x4: Int; x5: Int; x6: Int; x7: Int; x8: Int;
    y1: Bool; y2: Bool; y3: Bool; y4: Bool;
    s1: String; s2: String; s3: String;
    addr: Address;
    cell: Cell;
}

contract StructInField {
    nested: BigNested;

    init() {
        self.nested = BigNested{
            x1:1, x2:2, x3:3, x4:4, x5:5, x6:6, x7:7, x8:8,
            y1:true,y2:false,y3:true,y4:false,
            s1:"a",s2:"b",s3:"c",
            addr: myAddress(), cell: emptyCell()
        };
    }
}
