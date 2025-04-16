struct WeirdBits {
    flag1: Int as uint1;
    flag2: Int as int1;
    num: Int as uint8;
    val: Int;
}

contract TestContract {
    wb: WeirdBits;

    init() {
        self.wb = WeirdBits{
            flag1:1,
            flag2:1,
            num:255,
            val:12345
        };
    }
}