struct Large {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    cell1: Cell;
    cell2: Cell;
}

contract LargeC {
    l: Large;
    init() {
        self.l = Large{
            i1:1,i2:2,i3:3,i4:4,i5:5,
            b1:true,b2:false,
            s1:"foo",s2:"bar",
            cell1: emptyCell(), cell2: emptyCell()
        };
    }
}