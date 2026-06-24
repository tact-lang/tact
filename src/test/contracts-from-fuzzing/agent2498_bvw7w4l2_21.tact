struct NestedOptional {
    foo: Int?;
    bar: String?;
}

struct Container {
    inner: NestedOptional;
}

contract TestContract {
    val: Container;

    init() {
        self.val = Container{
            inner: NestedOptional{
                foo: null,
                bar: null,
            }
        };
    }
}