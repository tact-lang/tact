struct NestedOptional {
    val: Int?;
}

struct Wrapper {
    inner: NestedOptional?;
}

contract OptionalNestedContract {
    storage: Wrapper;

    init() {
        self.storage = Wrapper{ inner: null };
    }
}