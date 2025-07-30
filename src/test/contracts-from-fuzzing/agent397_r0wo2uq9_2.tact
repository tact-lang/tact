struct NestedInner {
    n: Int;
    flag: Bool?;
}

struct Outer {
    inner: NestedInner;
    info: String;
}

contract DeepNestedOptional {
    data: Outer?;

    init() {
        self.data = null;
    }
}