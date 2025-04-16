struct LongList {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
    c1: Cell; c2: Cell; c3: Cell; c4: Cell; c5: Cell;
}

contract LongListTest {
    data: LongList;

    init() {
        self.data = LongList{
            a1:1,a2:2,a3:3,a4:4,a5:5,
            b1:true,b2:false,b3:true,b4:false,b5:true,
            s1:"a",s2:"b",s3:"c",s4:"d",s5:"e",
            c1:emptyCell(),c2:emptyCell(),c3:emptyCell(),c4:emptyCell(),c5:emptyCell()
        };
    }
}