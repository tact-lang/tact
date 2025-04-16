struct NestedOptional {
    maybeInner: Inner?;
}

struct Inner {
    val: Int;
    txt: String;
}

contract Test14 {
    no: NestedOptional;

    init() {
        self.no = NestedOptional{ maybeInner: null };
    }
}