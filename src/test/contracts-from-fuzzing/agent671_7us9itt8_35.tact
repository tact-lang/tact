struct InnerMost {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct MidLayer {
    inner: InnerMost;
    label: String;
}

struct OuterLayer {
    midLayer: MidLayer;
    flag: Bool;
}

contract TestContract {
    bigStore: OuterLayer;

    init() {
        self.bigStore = OuterLayer{
            midLayer: MidLayer{
                inner: InnerMost{ a: null, b: null, c: null },
                label: "deep nulls"
            },
            flag: true
        };
    }
}