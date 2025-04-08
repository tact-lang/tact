struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    foo: Int;
    bar: Bool;
    baz: String?;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{
            inner: InnerStruct{
                foo: 1,
                bar: true,
                baz: "test"
            }
        };
    }
}