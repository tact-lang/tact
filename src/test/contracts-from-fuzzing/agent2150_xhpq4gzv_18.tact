struct ManyOptionalInt {
    i0: Int?; i1: Int?; i2: Int?; i3: Int?; i4: Int?;
    i5: Int?; i6: Int?; i7: Int?; i8: Int?; i9: Int?;
}

contract TestContract {
    optInts: ManyOptionalInt;

    init() {
        self.optInts = ManyOptionalInt{
            i0:null,i1:null,i2:null,i3:null,i4:null,
            i5:null,i6:null,i7:null,i8:null,i9:null
        };
    }
}