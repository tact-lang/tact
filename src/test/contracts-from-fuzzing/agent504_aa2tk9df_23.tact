struct BoolIntMix {
    b: Bool;
    i: Int;
    b2: Bool;
    i2: Int;
}

contract BoolIntMixTest {
    val: BoolIntMix;

    init() {
        self.val = BoolIntMix{ b:true, i:7, b2:false, i2:42 };
    }
}