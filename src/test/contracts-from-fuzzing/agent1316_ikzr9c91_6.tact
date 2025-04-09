struct NestedOptional {
    child: Inner?;
}

struct Inner {
    s: String;
}

contract NestedOptionalTest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            child: null
        };
    }
}