struct Nested1 {
    a: Int;
}

struct Nested2 {
    inner: Nested1;
}

struct Nested3 {
    nested: Nested2;
}

struct Nested4 {
    n3: Nested3;
}

contract DeepChain {
    val: Nested4;
    init() {
        self.val = Nested4{
            n3: Nested3{
                nested: Nested2{
                    inner: Nested1{
                        a: 123,
                    },
                },
            },
        };
    }
}