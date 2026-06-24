struct OptionalContainer {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract Test {
    data: OptionalContainer;

    init() {
        self.data = OptionalContainer{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}