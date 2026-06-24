struct NestedBoolSeq {
    f1: Bool;
    f2: Bool?;
    f3: Bool;
    f4: Bool?;
}

contract VariousBoolOptions {
    d: NestedBoolSeq;

    init() {
        self.d = NestedBoolSeq{
            f1: true,
            f2: null,
            f3: false,
            f4: true
        };
    }
}