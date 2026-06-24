struct DeepInner {
    optValue: Int?;
}

struct MidLevel {
    deep: DeepInner;
    extra: Bool;
}

struct TopLevel {
    mid: MidLevel;
    addr: Address;
}

contract TestContract {
    nested: TopLevel;

    init() {
        self.nested = TopLevel{
            mid: MidLevel{
                deep: DeepInner{ optValue: null },
                extra: true,
            },
            addr: myAddress(),
        };
    }

    receive() {
        let _ = self.nested.mid.deep.optValue;
        let _ = self.nested.mid.extra;
        let _ = self.nested.addr;
    }
}