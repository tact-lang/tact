struct Nested1 {
    val1: Int;
}

struct Nested2 {
    val2: Bool;
    inner: Nested1;
    optInner: Nested1?;
}

struct Nested3 {
    val3: String;
    deeper: Nested2;
    optDeeper: Nested2?;
}

contract DeepNestTest {
    state: Nested3;

    init() {
        self.state = Nested3{
            val3: "test",
            deeper: Nested2{
                val2: true,
                inner: Nested1{val1: 42},
                optInner: null,
            },
            optDeeper: null,
        };
    }
}