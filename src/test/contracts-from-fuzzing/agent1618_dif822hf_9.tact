struct NestedEmbedded {
    foo: Embed1;
}

struct Embed1 {
    bar: Embed2;
}

struct Embed2 {
    baz: Embed3;
}

struct Embed3 {
    val1: Int;
    val2: String;
    val3: Bool?;
    val4: Address?;
}

contract TestContract {
    data: NestedEmbedded;

    init() {
        self.data = NestedEmbedded{
            foo: Embed1{
                bar: Embed2{
                    baz: Embed3{
                        val1: 123,
                        val2: "hello",
                        val3: null,
                        val4: null
                    }
                }
            }
        };
    }
}