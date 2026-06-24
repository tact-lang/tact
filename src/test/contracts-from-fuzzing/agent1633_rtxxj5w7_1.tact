struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    val1: Int;
    val2: Bool;
    optVal: String?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerStruct{
                val1: 1,
                val2: true,
                optVal: "abc",
            }
        };
    }
}