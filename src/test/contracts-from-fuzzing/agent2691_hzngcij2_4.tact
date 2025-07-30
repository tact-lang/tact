struct NestedOpt {
    a: Int?;
    b: Bool?;
}

contract OptionalTest {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            a: null,
            b: true
        };
    }
}