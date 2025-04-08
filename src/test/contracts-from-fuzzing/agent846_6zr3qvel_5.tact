struct NestedDefault {
    inner: InnerDefault;
}

struct InnerDefault {
    a: Int = 5;
    b: Bool = false;
}

contract TestNestedDefault {
    data: NestedDefault;

    init() {
        self.data = NestedDefault{
            inner: InnerDefault{}
        };
    }
}
