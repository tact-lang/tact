struct InnerMost {
    foo: Int;
    bar: Int?;
}

struct WrappedOptional {
    item: InnerMost?;
}

contract DeepNull {
    val: WrappedOptional;

    init() {
        self.val = WrappedOptional{ item: null };
    }
}