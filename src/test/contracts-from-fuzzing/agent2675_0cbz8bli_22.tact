struct Inside {
    x: Int?;
    y: Bool = false;
}

struct Outer {
    strVal: String?;
    inner: Inside?;
}

contract OptionalMix {
    data: Outer;

    init() {
        self.data = Outer{
            strVal: null,
            inner: null
        };
    }
}