struct SBoolInts {
    b: Bool;
    i1: Int;
    i2: Int;
}

contract OrderFieldTest {
    f: SBoolInts;

    init() {
        self.f = SBoolInts{ b: false, i1: 10, i2: 20 };
    }
}