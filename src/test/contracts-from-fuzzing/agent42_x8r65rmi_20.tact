struct InnerMost {
    value: Int;
}

struct MidLevel {
    inner: InnerMost;
}

struct TopLevel {
    mid: MidLevel;
}

contract TestContract {
    nested: TopLevel?;
    init() {
        self.nested = TopLevel{ mid: MidLevel{ inner: InnerMost{ value: 999 }}};
    }
}