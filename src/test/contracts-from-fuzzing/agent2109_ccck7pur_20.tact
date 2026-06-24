struct NestedOptional {
    val: Inner?;
}

struct Inner {
    x: Int;
}

contract TestNestedNullable {
    no: NestedOptional;

    init() {
        self.no = NestedOptional{ val: null };
    }
}