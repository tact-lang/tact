struct InnerComplex {
    a: Int as uint8 = 1;
    b: Int? as int16;
    c: Bool? = true;
    d: String = "ok";
}

struct OuterComplex {
    x: Int;
    nest: InnerComplex;
}

contract MixedNestedAll {
    data: OuterComplex;

    init() {
        self.data = OuterComplex{
            x: 5,
            nest: InnerComplex{ b: null }
        };
    }
}