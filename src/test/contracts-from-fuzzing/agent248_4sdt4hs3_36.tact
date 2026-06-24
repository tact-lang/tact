struct DefaultSerialization {
    i1: Int;
    i2: Int as uint256;
    i3: Int as int257;
    i4: Int as uint1;
    i5: Int as int16;
}

contract TestContract {
    s: DefaultSerialization;

    init() {
        self.s = DefaultSerialization{
            i1:1,i2:2,i3:3,i4:1,i5:5
        };
    }
}