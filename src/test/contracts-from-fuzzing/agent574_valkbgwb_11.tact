struct Inner {
    v: Int;
}

struct OptionalMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Inner?;
}

contract OptionalsMany {
    pers: OptionalMix;

    init() {
        self.pers = OptionalMix{
            a: null, b: null, c: null, d: null, e: null
        };
    }

    receive() {
        if (self.pers.e != null) {
            dump(self.pers.e!!.v);
        }
    }
}