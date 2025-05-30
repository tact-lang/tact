struct DeeplyNested {
    val: Int;
    next: InnerNested;
}

struct InnerNested {
    subVal: Int;
    flag: Bool;
}

contract DeepNestContract {
    dn: DeeplyNested;

    init() {
        self.dn = DeeplyNested{
            val: 1,
            next: InnerNested{
                subVal: 2,
                flag: false,
            }
        };
    }
}