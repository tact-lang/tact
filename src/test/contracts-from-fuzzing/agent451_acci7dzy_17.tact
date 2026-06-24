struct OptionallyNested {
    inner: MaybeInner?;
}

struct MaybeInner {
    flag: Bool;
}

contract OptionallyNestedContract {
    data: OptionallyNested;

    init() {
        self.data = OptionallyNested{ inner: null };
    }
}