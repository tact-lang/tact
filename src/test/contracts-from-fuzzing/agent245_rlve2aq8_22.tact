struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: Slice?;
}

contract MultiOptionalFieldsTest {
    data: MultiOpt;

    init() {
        self.data = MultiOpt{
            a: null,
            b: null,
            c: null
        };
    }
}