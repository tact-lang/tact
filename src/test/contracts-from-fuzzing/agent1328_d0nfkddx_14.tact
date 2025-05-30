struct S1 {
    arr1: Int;
    arr2: Int;
    arr3: Int;
    arr4: Int;
    arr5: Int;
    arr6: Int;
    arr7: Int;
    arr8: Int;
    arr9: Int;
    arr10: Int;
    arr11: Int;
    arr12: Int;
    arr13: Int;
    arr14: Int;
    arr15: Int;
    arr16: Int;
    arr17: Int;
    arr18: Int;
    arr19: Int;
    arr20: Int;
    arr21: Int;
    arr22: Int;
    arr23: Int;
    arr24: Int;
    arr25: Int;
    arr26: Int;
    arr27: Int;
    arr28: Int;
    arr29: Int;
    arr30: Int;
    arr31: Int;
    arr32: Int;
}

contract BigStorage {
    data: S1;
    init() {
        self.data = S1{
            arr1: 1, arr2: 2, arr3: 3, arr4:4, arr5: 5,
            arr6: 6, arr7:7, arr8:8, arr9:9, arr10:10,
            arr11:11, arr12:12, arr13:13, arr14:14, arr15:15,
            arr16:16, arr17:17, arr18:18, arr19:19, arr20:20,
            arr21:21, arr22:22, arr23:23, arr24:24, arr25:25,
            arr26:26, arr27:27, arr28:28, arr29:29, arr30:30,
            arr31:31, arr32:32
        };
    }
}