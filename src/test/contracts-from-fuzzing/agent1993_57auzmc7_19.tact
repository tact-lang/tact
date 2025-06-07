struct HasNestedOption {
    obj: Nested?;
}

struct Nested {
    val: Int;
}

contract TestContract {
    f: HasNestedOption;

    init() {
        self.f = HasNestedOption{ obj: null };
    }
}