struct BigStruct {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    i6: Int;
    i7: Int;
    i8: Int;
    i9: Int;
    i10: Int;
}

contract BigFields {
    field: BigStruct;

    init() {
        self.field = BigStruct{
            i1:1,i2:2,i3:3,i4:4,i5:5,i6:6,i7:7,i8:8,i9:9,i10:10
        };
    }
}
