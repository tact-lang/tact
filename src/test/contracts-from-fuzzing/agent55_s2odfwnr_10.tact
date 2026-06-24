struct SOptInner {
    innerVal: Int = 100;
    innerOpt: Bool?;
}

struct SOuter {
    val: Int = 50;
    opt: SOptInner?;
}

contract OptNestedStructs {
    s: SOuter;

    init() {
        self.s = SOuter{
            val: 50,
            opt: null
        };
    }
}
