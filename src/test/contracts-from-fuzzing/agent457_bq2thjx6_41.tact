struct HighBitPackingNested {
    tiny1: Int as uint1;
    tiny2: Int as uint1;
    small: Int as uint4;
    big: Int as int257;
    opt1: Int? = null;
    opt2: Bool? = null;
    opt3: String? = null;
}

contract BitPackStress {
    val: HighBitPackingNested;
    
    init() {
        self.val = HighBitPackingNested{
            tiny1: 1,
            tiny2: 0,
            small: 7,
            big: 123456789,
            opt1: null,
            opt2: null,
            opt3: null
        };
    }
}