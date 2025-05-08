struct DeepInner {
    addr: Address?;
    txt: String?;
}

struct TopMix {
    val: Int;
    ni: DeepInner;
}

contract DeepOptMix {
    s: TopMix;

    init() {
        self.s = TopMix{
            val: 999,
            ni: DeepInner{
                addr: null,
                txt: "hello"
            }
        };
    }
}