struct Nested {
    val1: Int;
    val2: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    opt1: Int?;
    opt2: Bool?;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{
            val1: 1,
            val2: true,
            inner: InnerStruct{
                opt1: null,
                opt2: false,
            },
        };
    }
}