struct OptionalNested {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{
            a: null,
            b: true,
            c: null
        };
    }
}