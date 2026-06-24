struct InnerMost {
    z: Int;
}

struct Inner {
    y: Int;
    deep: InnerMost?;
}

struct Outer {
    x: Int;
    nested: Inner;
}

contract DeepStorage {
    payload: Outer;

    init() {
        self.payload = Outer{
            x: 7,
            nested: Inner{
                y: 8,
                deep: null,
            },
        };
    }
}