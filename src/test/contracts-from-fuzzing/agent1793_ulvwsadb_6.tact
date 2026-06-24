struct MultiOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    opts: MultiOptionals;

    init() {
        self.opts = MultiOptionals{
            a: null,
            b: true,
            c: null
        };
    }
}