struct UnusualOrder {
    b: Bool;
    s: String;
    i: Int;
    o: Int?;
}

contract OrderAndTypesTest {
    data: UnusualOrder;

    init() {
        self.data = UnusualOrder{
            b: true,
            s: "yo",
            i: 123,
            o: null
        };
    }
}