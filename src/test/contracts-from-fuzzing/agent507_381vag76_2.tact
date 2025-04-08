struct DeepNested {
    value: Int?;
}

struct MiddleNested {
    middle: DeepNested?;
}

struct Outer {
    inner: MiddleNested;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            inner: MiddleNested{middle: null}
        };
    }
}