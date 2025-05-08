struct RecursiveOptional {
    inner: RecursiveInner?;
}

struct RecursiveInner {
    x: Int;
    y: String?;
}

contract TestContract {
    field: RecursiveOptional;

    init() {
        self.field = RecursiveOptional{
            inner: RecursiveInner{ x: 9, y: null }
        };
    }
}