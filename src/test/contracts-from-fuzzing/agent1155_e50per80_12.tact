struct TestStruct {
    i1: Int; i2: Int; i3: Int; i4: Int; i5: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
    c1: Cell; c2: Cell; c3: Cell; c4: Cell; c5: Cell;
}

contract TestContract {
    field: TestStruct;

    init() {
        self.field = TestStruct{
            i1:1, i2:2, i3:3, i4:4, i5:5,
            b1:true, b2:false, b3:true, b4:false, b5:true,
            s1:"s1", s2:"s2", s3:"s3", s4:"s4", s5:"s5",
            c1:emptyCell(), c2:emptyCell(), c3:emptyCell(), c4:emptyCell(), c5:emptyCell()
        };
    }
}
