struct NestedOptionalBool {
    b: Bool?;
}

struct WithOptionalNested {
    inner: NestedOptionalBool?;
}

contract TestOptional {
    data: WithOptionalNested;

    init() {
        self.data = WithOptionalNested{
            inner: NestedOptionalBool{ b: true }
        };
    }
}
