struct Nested {
    inner: InnerStruct?; 
}

struct InnerStruct {
    val: Int?;
    flag: Bool;
}

contract DeepOptionalTest {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerStruct{
                val: null,
                flag: true,
            }
        };
    }
}
