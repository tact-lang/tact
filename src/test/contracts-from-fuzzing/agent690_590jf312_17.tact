struct NestedMix {
    level1: Mix1;
}

struct Mix1 {
    x: Int;
    y: Bool?;
    z: Inner;
}

struct Inner {
    foo: String?;
    bar: Int;
}

contract NestedVariants {
    v: NestedMix;

    init() {
        self.v = NestedMix{
            level1: Mix1{
                x: 5,
                y: null,
                z: Inner{
                    foo: null,
                    bar: 10
                }
            }
        };
    }
}