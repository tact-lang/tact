struct InnerOne { a: Int; b: Bool; }
struct InnerTwo { c: Int?; d: Bool; e: Int; }
struct MixedStruct {
    first: InnerOne;
    second: InnerTwo;
    lastVal: Int?;
}

contract DiverseFields {
    store: MixedStruct;

    init() {
        self.store = MixedStruct{
            first: InnerOne{ a: 1, b: true },
            second: InnerTwo{ c: null, d:false, e:5 },
            lastVal: null
        };
    }
}
