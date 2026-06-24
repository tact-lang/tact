struct Deep {
    inner: NestedOpt;
}

struct NestedOpt {
    field1: Int?;
    field2: Bool?;
    field3: String?;
}

contract TestContract {
    deepField: Deep;

    init() {
        self.deepField = Deep{
            inner: NestedOpt{
                field1: 123,
                field2: false,
                field3: "hi",
            }
        };
    }
}