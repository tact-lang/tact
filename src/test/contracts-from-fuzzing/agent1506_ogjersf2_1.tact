struct NestedStruct {
    a: Int;
    b: Bool?;
    c: InnerStruct;
}

struct InnerStruct {
    d: String;
    e: Int?;
}

contract TestContract {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            a: 1,
            b: true,
            c: InnerStruct{
                d: "Hello",
                e: 5,
            },
        };
    }
}