struct InnerDefault {
    x: Int = 99;
}

struct OuterDefault {
    inner: InnerDefault;
}

contract WrapDefaults {
    val: OuterDefault;

    init() {
        self.val = OuterDefault{
            inner: InnerDefault{}
        };
    }
}