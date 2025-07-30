struct Nested {
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    count: Int?;
}

contract DeepOptional {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerStruct{
                flag: true,
                count: null
            }
        };
    }
}
