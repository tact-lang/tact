struct CrazySerialize {
    i1: Int as int1;
    u3: Int as uint3;
    i7: Int as int7;
    u13: Int as uint13;
    i22: Int as int22;
    u55: Int as uint55;
    i100: Int as int100;
    u200: Int as uint200;
}

contract TestContract {
    data: CrazySerialize;

    init() {
        self.data = CrazySerialize{
            i1:1,
            u3:7,
            i7:64,
            u13:8191,
            i22:2097151,
            u55:36028797018963967,
            i100:633825300114114700748351602687,
            u200:1606938044258990275541962092341162602522202993782792835301375
        };
    }
}
