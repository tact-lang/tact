// persistent array simulation with nested struct
struct FixedArr {
    e0: Int;
    e1: Int;
    e2: Int;
    e3: Int;
    e4: Int;
    e5: Int;
    e6: Int;
    e7: Int;
    e8: Int;
    e9: Int;
}

contract PackedArray {
    arr: FixedArr;
    init() {
        self.arr = FixedArr{
            e0:0, e1:1, e2:2, e3:3, e4:4,
            e5:5, e6:6, e7:7, e8:8, e9:9
        };
    }
}
