struct NestedNulls {
    a: Int?;
    b: Int?;
    c: Int?;
}

struct ContainerOptional {
    inner: NestedNulls?;
}

contract ContainerOptionalTest {
    val: ContainerOptional;

    init() {
        self.val = ContainerOptional{
            inner: null,
        };
    }
}