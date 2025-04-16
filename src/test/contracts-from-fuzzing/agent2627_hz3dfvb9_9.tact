struct Deep {
    inner1: Int;
    inner2: Int;
    inner3: Int;
    inner4: Int;
    inner5: Int;
    inner6: Int;
    inner7: Int;
    inner8: Int;
    inner9: Int;
    inner10: Int;
    inner11: Int;
    inner12: Int;
    inner13: Int;
    inner14: Int;
    inner15: Int;
    inner16: Int;
}

contract LargeStruct {
    data: Deep;

    init() {
        self.data = Deep{
            inner1:1, inner2:2, inner3:3, inner4:4,
            inner5:5, inner6:6, inner7:7, inner8:8,
            inner9:9, inner10:10, inner11:11, inner12:12,
            inner13:13, inner14:14, inner15:15, inner16:16
        };
    }
}