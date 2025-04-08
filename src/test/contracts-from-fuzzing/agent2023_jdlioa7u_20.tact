struct OptionalWrapped {
    inner: Int?;
}

struct NestedOptionalWrapper {
    wrapped: OptionalWrapped;
    maybeOuter: String?;
}

contract TestContract {
    data: NestedOptionalWrapper;

    init() {
        self.data = NestedOptionalWrapper{
            wrapped: OptionalWrapped{ inner: null },
            maybeOuter: "hi"
        };
    }
    receive() { let k = self.data.wrapped.inner; }
}