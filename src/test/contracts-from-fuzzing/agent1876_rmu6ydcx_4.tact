struct NestedOpt {
    field1: Int?;
    field2: Bool?;
    inner: InnerOpt;
}

struct InnerOpt {
    flag: Bool?;
    text: String?;
}

contract StorageTest {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            field1: null,
            field2: null,
            inner: InnerOpt{
                flag: null,
                text: null
            }
        };
    }
}