struct DeepDefaultNest {
    outer: Middle;
}

struct Middle {
    inner: Inner;
}

struct Inner {
    flag: Bool = false;
    val: Int?;
}

contract DefaultDeep {
    nested: DeepDefaultNest;

    init() {
        self.nested = DeepDefaultNest{
            outer: Middle{
                inner: Inner{}
            }
        };
    }
}
