struct NestedOptional {
    maybeInner: Inner?;
    note: String = "nested opt";
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract DeepContainer {
    x: NestedOptional;
    init() {
        self.x = NestedOptional{
            maybeInner: null
        };
    }
}