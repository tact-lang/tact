struct SInner {
    val: Int;
    opt: Bool?;
}

struct SOuter {
    s1: SInner;
    flag: Bool;
}

contract ContractX {
    persistent: SOuter;

    init() {
        self.persistent = SOuter{
            s1: SInner{
                val: 99,
                opt: null
            },
            flag: true
        };
    }
}