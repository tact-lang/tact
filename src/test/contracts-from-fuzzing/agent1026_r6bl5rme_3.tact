struct OptionalNested {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract OptionalTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            s: null,
            i: null,
            b: null,
        };
    }
}