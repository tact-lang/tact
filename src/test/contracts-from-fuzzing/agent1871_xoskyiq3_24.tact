struct EmptyNestedOptionals {
    a: InnerEmpty?;
}

struct InnerEmpty {
    b: Bool?;
    s: String?;
}

contract EmptyOptContract {
    val: EmptyNestedOptionals;

    init() {
        self.val = EmptyNestedOptionals { a: null };
    }
}