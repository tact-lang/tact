struct DeepNested {
    inner1: Inner1;
}

struct Inner1 {
    inner2: Inner2?;
}

struct Inner2 {
    value: Int;
}

contract Test {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner1: Inner1{
                inner2: Inner2{
                    value: 42,
                },
            },
        };
    }
}