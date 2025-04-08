struct OptionChain {
    x: Int?;
    y: Bool?;
    z: String?;
    next: OptionInner?;
}

struct OptionInner {
    flag: Bool;
    val: Int?;
}

contract Optioned {
    opt: OptionChain;

    init() {
        self.opt = OptionChain{
            x: 5,
            y: null,
            z: null,
            next: OptionInner{
                flag: true,
                val: null
            }
        };
    }
}
