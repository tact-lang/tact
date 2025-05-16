// Nested optional with inner struct having optional and required
struct OuterOpt {
    inner: InnerStruct?;
}

struct InnerStruct {
    important: Int;
    description: String?;
}

contract NestedOptRequiredTest {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: InnerStruct{
                important: 777,
                description: null
            }
        };
    }
}
