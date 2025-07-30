struct Inner {
    data: Int?;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    innerLayer: Middle;
    sVal: String?;
}

contract NullableLayered {
    store: Outer;

    init() {
        self.store = Outer{
            innerLayer: Middle{
                inner: Inner{
                    data: null
                }
            },
            sVal: null
        };
    }
}