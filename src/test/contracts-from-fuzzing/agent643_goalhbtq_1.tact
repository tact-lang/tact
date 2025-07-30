struct Nested {
    val1: Int;
    val2: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    number: Int;
}

contract TestNested {
    data: Nested;
    
    init() {
        self.data = Nested{
            val1: 5,
            val2: true,
            inner: InnerStruct{
                flag: false,
                number: 42,
            },
        };
    }
}