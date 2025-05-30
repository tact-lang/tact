struct HugeStruct {
    x1: Int; x2:Int; x3:Int; x4:Int; x5:Int;
    x6: Int; x7:Int; x8:Int; x9:Int; x10:Int;
    x11:Int; x12:Int; x13:Int; x14:Int; x15:Int;
    x16:Int; x17:Int; x18:Int; x19:Int; x20:Int;
}

contract StorageTest {
    val: HugeStruct;

    init() {
        self.val = HugeStruct{
            x1:1,x2:2,x3:3,x4:4,x5:5,
            x6:6,x7:7,x8:8,x9:9,x10:10,
            x11:11,x12:12,x13:13,x14:14,x15:15,
            x16:16,x17:17,x18:18,x19:19,x20:20
        };
    }
}