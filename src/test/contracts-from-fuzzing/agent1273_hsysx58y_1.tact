struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    val1: Int;
    val2: Bool;
    optVal: Int?;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            inner: InnerStruct{
                val1: 1,
                val2: true,
                optVal: null
            }
        };
    }
}