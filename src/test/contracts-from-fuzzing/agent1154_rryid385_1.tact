struct Nested {
    val1: Int;
    val2: Bool?;
    inner: InnerStruct;
}

struct InnerStruct {
    val3: String;
    val4: Int?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            val1: 1,
            val2: true,
            inner: InnerStruct{
                val3: "test",
                val4: 4,
            },
        };
    }
}
