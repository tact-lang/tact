struct BigOne {
    a0: Int; a1: Int; a2: Int; a3: Int; a4: Int;
    a5: Int; a6: Int; a7: Int; a8: Int; a9: Int;
    b0: Bool; b1: Bool; b2: Bool; b3: Bool; b4: Bool;
    c0: Cell; c1: Cell; c2: Cell; c3: Cell; c4: Cell;
    s0: String; s1: String; s2: String; s3: String; s4: String;
}

contract ManyField {
    data: BigOne;

    init() {
        self.data = BigOne{
            a0:0,a1:1,a2:2,a3:3,a4:4,
            a5:5,a6:6,a7:7,a8:8,a9:9,
            b0:true,b1:false,b2:true,b3:false,b4:true,
            c0:emptyCell(),c1:emptyCell(),c2:emptyCell(),c3:emptyCell(),c4:emptyCell(),
            s0:"a",s1:"b",s2:"c",s3:"d",s4:"e",
        };
    }
}