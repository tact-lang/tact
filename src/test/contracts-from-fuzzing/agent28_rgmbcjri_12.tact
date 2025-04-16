struct InnerLarge {
    F1: Int;
    F2: Int;
    F3: Int;
    F4: Int;
    F5: Int;
    F6: Int;
}

struct OuterLarge {
    I1: InnerLarge;
    I2: InnerLarge?;
    I3: InnerLarge;
    Extra: Int;
}

contract TestLargeNested {
    receive() {
        let inner: InnerLarge = InnerLarge { F1: 10, F2: 20, F3: 30, F4: 40, F5: 50, F6: 60 };
        let outer: OuterLarge = OuterLarge { I1: inner, I2: null, I3: inner, Extra: 1000 };
        dump(outer.I1.F3 + outer.Extra);
    }
}
