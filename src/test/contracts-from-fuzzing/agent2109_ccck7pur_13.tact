struct Big {
    num1: Int;
    num2: Int;
    num3: Int;
    num4: Int;
    num5: Int;
    num6: Int;
    num7: Int;
    num8: Int;
    num9: Int;
    num10: Int;
    num11: Int;
    num12: Int;
    num13: Int;
    num14: Int;
    num15: Int;
    num16: Int;
    num17: Int;
    num18: Int;
    num19: Int;
    num20: Int;
}

contract LargeStructStorage {
    big: Big;

    init() {
        self.big = Big{
            num1:1,num2:2,num3:3,num4:4,num5:5,num6:6,num7:7,num8:8,num9:9,num10:10,
            num11:11,num12:12,num13:13,num14:14,num15:15,num16:16,num17:17,num18:18,num19:19,num20:20
        };
    }
}