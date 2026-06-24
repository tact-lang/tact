struct DeepNested {
    inner: Nested2;
}

struct Nested2 {
    innerMost: Nested3?;
}

struct Nested3 {
    value: Int;
}

contract TestContract {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            inner: Nested2{
                innerMost: Nested3{
                    value: 123
                }
            }
        };
    }
}