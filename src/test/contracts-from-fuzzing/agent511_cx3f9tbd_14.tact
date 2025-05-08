struct DeepNestedOptional {
    inner: Int?;
}

struct MidOptional {
    nested: DeepNestedOptional?;
}

struct Outer {
    val: Int;
    mid: MidOptional?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            val: 5,
            mid: null
        };
    }
}