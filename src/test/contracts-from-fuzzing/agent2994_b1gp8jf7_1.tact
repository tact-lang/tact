struct Nested {
    num: Int;
    flag: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    text: String;
    optionalNum: Int?;
}

contract DeepStructTest {
    nestedField: Nested;
    
    init() {
        self.nestedField = Nested{
            num: 1,
            flag: true,
            inner: InnerStruct{
                text: "abc",
                optionalNum: null,
            }
        };
    }
}