message(11) Msg1 { a: Int }
struct Inner { b: Int }

struct MixedComplex {
    x: Msg1;
    y: Inner;
    z: String;
    w: Msg1?;
}

contract MixedComplexStore {
    data: MixedComplex;

    init() {
        self.data = MixedComplex{
            x: Msg1{a:1},
            y: Inner{b:2},
            z: "hi",
            w: null
        };
    }
}