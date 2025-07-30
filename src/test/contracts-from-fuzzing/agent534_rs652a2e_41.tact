struct DefaultOptionMix {
    a: Int = 1;
    b: Int?;
    c: Int? = null;
    d: Bool = true;
    e: Bool?;
    f: Bool? = null;
}

contract DefaultOptionMixTest {
    val: DefaultOptionMix;

    init() {
        self.val = DefaultOptionMix{
            b:null,
            e:null
        };
    }
}