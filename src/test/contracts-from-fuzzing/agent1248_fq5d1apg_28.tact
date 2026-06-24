struct Packed {
    i1: Int as uint8;
    i2: Int as uint4;
    i3: Int as int16;
    flag: Bool;
    s: String;
}

contract PackedStorage {
    p: Packed;

    init() {
        self.p = Packed{i1:10,i2:5,i3:-7,flag:true,s:"ok"};
    }
}
