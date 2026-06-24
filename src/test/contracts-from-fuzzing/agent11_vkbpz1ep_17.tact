struct Deep {
    a: Int?;
    b: Bool;
}

struct Wrap {
    inner: Deep?;
}

contract TestContract {
    field: Wrap?;

    init() {
        self.field = null;
    }
}