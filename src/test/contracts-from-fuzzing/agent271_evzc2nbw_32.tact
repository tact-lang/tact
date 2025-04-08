struct OptionDefaultMix {
    a: Int? = null;
    b: Int;
    c: Bool? = null;
    d: Bool;
}

contract OptionDefMixTest {
    s: OptionDefaultMix;

    init() {
        self.s = OptionDefaultMix{ b:1,d:true };
    }
}
