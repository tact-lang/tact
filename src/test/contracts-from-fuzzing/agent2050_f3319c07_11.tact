struct NumberHolder {
    val1: Int as uint8;  
    val2: Int as int16;
    val3: Int as uint32;
    val4: Int as int64;
    val5: Int as uint128;
}

contract SerTest {
    holder: NumberHolder;

    init() {
        self.holder = NumberHolder{
            val1: 255,
            val2: -30000,
            val3: 4294967295,
            val4: -5000000000,
            val5: 340282366920938463463374607431768211455
        };
    }
}