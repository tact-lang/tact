struct M {
    val1: Int;
    val2: Int;
    val3: Int;
    val4: Int;
    val5: Int;
    val6: Int;
    val7: Int;
    val8: Int;
    val9: Int;
    val10: Int;
    val11: Int;
    val12: Int;
}

contract Twelve {
    big: M;

    init() {
        self.big = M{
            val1:1, val2:2, val3:3, val4:4, val5:5, val6:6,
            val7:7, val8:8, val9:9, val10:10, val11:11, val12:12
        };
    }
}