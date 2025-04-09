struct SerialExotic {
    i1: Int as int7;
    i2: Int as uint17;
    i3: Int as int29;
    i4: Int as uint64;
    i5: Int as int101;
}

contract SerialExoticContract {
    s: SerialExotic;
    init() {
        self.s = SerialExotic{
            i1:1,i2:2,i3:3,i4:4,i5:5
        };
    }
}