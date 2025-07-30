struct DeepNested {
    i: Int;
    sn: InnerNest;
}

struct InnerNest {
    flag: Bool;
    s: SubInner;
}

struct SubInner {
    x: Int?;
    b: Bool;
}

contract TestContract {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            i: 1,
            sn: InnerNest{
                flag: true,
                s: SubInner{
                    x: null,
                    b: false
                }
            }
        };
    }
}