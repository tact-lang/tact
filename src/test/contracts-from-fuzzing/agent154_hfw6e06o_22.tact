struct MixNestedOpt {
    a: Int;
    b: Bool?;
    c: SOpt;
    d: SOpt?;
}

struct SOpt {
    val: Int?;
}

contract MixNestedOptContract {
    data: MixNestedOpt;

    init() {
        self.data = MixNestedOpt{
            a: 1,
            b: null,
            c: SOpt{val: null},
            d: null
        };
    }
}