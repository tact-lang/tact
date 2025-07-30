struct OptionalNested {
    inner: InnerStruct?;
    flag: Bool;
}

struct InnerStruct {
    value: Int?;
    marker: Bool?;
}

contract OptionalTest {
    store: OptionalNested;
    
    init() {
        self.store = OptionalNested{
            inner: InnerStruct{
                value: 7,
                marker: null
            },
            flag: true
        };
    }
}
