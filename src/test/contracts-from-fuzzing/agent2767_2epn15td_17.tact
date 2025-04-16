struct OptionalNested {
    child: Int?;
}

contract OptionalStructInit {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{ child: null };
    }
}