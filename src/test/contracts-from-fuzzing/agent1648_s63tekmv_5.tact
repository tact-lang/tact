struct BoolIntMix {
    flag1: Bool;
    val1: Int;
    flag2: Bool;
    val2: Int;
}

contract TestContract {
    state: BoolIntMix;
    
    init() {
        self.state = BoolIntMix{
            flag1: true,
            val1: 123,
            flag2: false,
            val2: 456
        };
    }
}