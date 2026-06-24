// Deep optional 3-level chain: Opt<Struct<Opt<Struct<Opt<Int>>>>> 
struct InnerMost {
    num: Int?;
}

struct Mid {
    inner: InnerMost?;
}

contract DeepOptChain {
    val: Mid?;

    init() {
        self.val = null;
    }
}
