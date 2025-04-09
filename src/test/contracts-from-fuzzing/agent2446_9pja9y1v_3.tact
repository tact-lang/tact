struct OptionalNested {
    a: Int?;
    b: Bool?;
}

contract OptionalContract {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{
            a: null,
            b: true
        };
    }
}