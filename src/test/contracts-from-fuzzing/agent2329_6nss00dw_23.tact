struct ManyInts {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
}

contract IntStorage {
    data: ManyInts;

    init() {
        self.data = ManyInts{
            i1:1,i2:2,i3:3,i4:4,i5:5
        };
    }
}
