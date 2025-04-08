struct OptionalContainer {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    s: OptionalContainer;
    init() {
        self.s = OptionalContainer{
            a: null,
            b: true,
            c: null,
            d: null
        };
    }
}