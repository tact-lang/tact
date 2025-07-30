struct NestedSomeDefault {
    i: Int = 1;
    inner: InnerDefault;
}

struct InnerDefault {
    s: String = "x";
}

contract NestedSomeDefaults {
    z: NestedSomeDefault;

    init() {
        self.z = NestedSomeDefault{
            inner: InnerDefault{}
        };
    }
}