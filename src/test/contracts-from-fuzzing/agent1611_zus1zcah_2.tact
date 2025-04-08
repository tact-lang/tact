struct MultiOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: Address?;
    f: String?;
}

contract OptsTest {
    testData: MultiOptionals;
    init() {
        self.testData = MultiOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}