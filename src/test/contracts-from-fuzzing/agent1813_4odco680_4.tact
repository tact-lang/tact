struct BigFlat {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
    sl1: Slice; sl2: Slice; sl3: Slice; sl4: Slice; sl5: Slice;
}

contract LotsOfFields {
    data: BigFlat;

    init() {
        self.data = BigFlat{
            a1:1,a2:2,a3:3,a4:4,a5:5,
            b1:true,b2:false,b3:true,b4:false,b5:true,
            s1:"a",s2:"b",s3:"c",s4:"d",s5:"e",
            sl1:emptyCell().asSlice(), sl2:emptyCell().asSlice(), sl3:emptyCell().asSlice(), sl4:emptyCell().asSlice(), sl5:emptyCell().asSlice()
        };
    }
}