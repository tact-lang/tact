struct DeepNested3 {
    val: Int;
}

struct DeepNested2 {
    inner: DeepNested3;
}

struct DeepNested1 {
    inner: DeepNested2;
}

struct Outer {
    nested: DeepNested1;
}

contract DeepContract {
    state: Outer = Outer{
        nested: DeepNested1{
            inner: DeepNested2{
                inner: DeepNested3{
                    val: 7,
                },
            },
        },
    };
}
