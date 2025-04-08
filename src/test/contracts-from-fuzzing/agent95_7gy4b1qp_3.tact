struct OptionalNested {
    v: Int?;
    w: Bool?;
}

contract OptionalStructContract {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{ v: null, w: true };
    }
}