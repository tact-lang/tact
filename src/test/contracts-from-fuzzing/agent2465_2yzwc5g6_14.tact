struct NestedMix {
    a: Int;
    b: Bool;
    c: InnerOpt;
}

struct InnerOpt {
    val: String?;
    flag: Bool;
}

contract TestContract {
    data: NestedMix;

    init() {
        self.data = NestedMix{
            a: 1,
            b: false,
            c: InnerOpt{
                val: null,
                flag: true
            }
        };
    }
}