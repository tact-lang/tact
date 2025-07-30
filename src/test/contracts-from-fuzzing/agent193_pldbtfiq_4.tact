struct Deep {
    p: Int?;
    q: Int;
}

struct NestedOptional {
    inner: Deep?;
}

contract Test {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{inner: null};
    }
}