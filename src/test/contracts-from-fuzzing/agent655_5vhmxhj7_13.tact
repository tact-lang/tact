struct NestedOptionals {
    inner: OptionalInner?;
}

struct OptionalInner {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            inner: OptionalInner{
                a: null,
                b: true,
                c: null,
            }
        };
    }
}
