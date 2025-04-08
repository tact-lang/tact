struct MultiOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract MultiOptionalsTest {
    st: MultiOptionals;

    init() {
        self.st = MultiOptionals{
            a: 1,
            b: null,
            c: "hello",
            d: null
        };
    }
}