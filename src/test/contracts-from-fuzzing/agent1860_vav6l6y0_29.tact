struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    value: Int?;
}

contract DeepInit {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ inner: null };
    }
}