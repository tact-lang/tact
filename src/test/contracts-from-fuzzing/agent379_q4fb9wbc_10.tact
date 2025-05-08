struct MultipleNestedOptionals {
    optInner: Inner?;
}

struct Inner {
    number: Int?;
}

contract MultiOptionals {
    complex: MultipleNestedOptionals;

    init() {
        self.complex = MultipleNestedOptionals{ optInner: Inner{ number: null } };
    }
}