struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{
            inner: InnerStruct{
                x: 1,
                y: null,
            },
        };
    }
}