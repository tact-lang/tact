struct HasOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedOptionals {
    opt: HasOptionals;

    init() {
        self.opt = HasOptionals{
            a: null,
            b: null,
            c: null
        };
    }
}