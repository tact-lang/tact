struct DeepNested {
    a: Int;
    b: Int?;
}

struct Outer {
    val: Int;
    inner: DeepNested;
}

contract DeeplyNestedContract {
    data: Outer;

    init() {
        self.data = Outer{
            val: 10,
            inner: DeepNested{ a: 20, b: null }
        };
    }
}