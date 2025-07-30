struct LotsOfNulls {
    o1: Int? = null;
    o2: Bool? = null;
    o3: String? = null;
    s1: Sub? = null;
    s2: Sub? = null;
    s3: Sub? = null;
    s4: Sub? = null;
    s5: Sub? = null;
    s6: Sub? = null;
    s7: Sub? = null;
}

struct Sub {
    x: Int = 0;
}

contract ManyOptionals {
    lots: LotsOfNulls;

    init() {
        self.lots = LotsOfNulls{};
    }
}
