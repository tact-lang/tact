struct DeeplyNested {
    inner: InnerLevel1;
}

struct InnerLevel1 {
    inner: InnerLevel2;
}

struct InnerLevel2 {
    value: Int;
}

contract TestContract {
    field: DeeplyNested;

    init() {
        self.field = DeeplyNested{
            inner: InnerLevel1{
                inner: InnerLevel2{
                    value: 42
                }
            }
        };
    }
}