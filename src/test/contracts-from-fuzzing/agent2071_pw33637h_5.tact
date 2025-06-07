struct InnerMost {
    flag: Bool;
}

struct MidLevel {
    nested: InnerMost;
}

struct TopStruct {
    inner: MidLevel;
}

contract ComplexField {
    data1: TopStruct;
    data2: TopStruct;
    data3: TopStruct;

    init() {
        self.data1 = TopStruct{ inner: MidLevel{ nested: InnerMost{ flag: true } } };
        self.data2 = TopStruct{ inner: MidLevel{ nested: InnerMost{ flag: false } } };
        self.data3 = TopStruct{ inner: MidLevel{ nested: InnerMost{ flag: true } } };
    }
}