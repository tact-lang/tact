struct OptionalDeepNest {
    deep: Deep?;
}

struct Deep {
    inner: Inner?;
    val: Int;
}

struct Inner {
    flag: Bool?;
    innerVal: Int;
}

contract MixOptionals {
    state: OptionalDeepNest;
    init() {
        self.state = OptionalDeepNest{
            deep: Deep{
                val: 5,
                inner: Inner{flag: null, innerVal: 7}
            }
        };
    }
}
