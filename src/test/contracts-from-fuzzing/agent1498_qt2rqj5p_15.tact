struct ComposeOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract TestContract {
    opts: ComposeOptionals;

    init() {
        self.opts = ComposeOptionals{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}
