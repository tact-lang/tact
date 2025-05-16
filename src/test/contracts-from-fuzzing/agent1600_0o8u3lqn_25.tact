struct IntSer {
    i1: Int as int64;
    i2: Int as int128;
    i3: Int as uint4;
    i4: Int as uint32;
}

contract SerializedIntContract {
    data: IntSer;

    init() {
        self.data = IntSer{i1: 5, i2: 6, i3: 7, i4: 8};
    }
}