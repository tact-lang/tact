struct OptStruct {
    val: Int?;
    nested: Nested?;
}

struct Nested {
    a: Int;
    b: String?;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            val: null,
            nested: Nested{
                a: 42,
                b: null
            }
        };
    }
}