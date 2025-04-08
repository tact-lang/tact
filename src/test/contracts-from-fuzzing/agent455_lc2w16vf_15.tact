struct TINY {
 a: Int as uint1; 
}

contract MinimalBits {
    tinyVal: TINY;

    init() {
        self.tinyVal = TINY{
            a: 1,
        };
    }
}