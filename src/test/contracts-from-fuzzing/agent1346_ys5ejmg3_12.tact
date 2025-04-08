struct DeepOpt {
    value: Int?;
}

struct Wrapper {
    nested: DeepOpt?;
}

contract OptionChain {
    w: Wrapper = Wrapper { nested: null };
    out: Int = 0;

    init() {
        if (self.w.nested != null && self.w.nested!!.value != null) {
            self.out = self.w.nested!!.value!!;
        } else {
            self.out = -1;
        }
    }
}
