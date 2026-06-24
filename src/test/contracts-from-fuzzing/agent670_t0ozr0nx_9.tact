struct NestedOptional {
    inner: Int?;
}

struct Outer {
    nested: NestedOptional?;
    val: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: null,
            val: 55,
        };
    }
}