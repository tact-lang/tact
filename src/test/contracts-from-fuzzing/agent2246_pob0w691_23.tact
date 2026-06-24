struct MultipleOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ManyOpts {
    vals: MultipleOptionals;

    init() {
        self.vals = MultipleOptionals{
            a: null,
            b: true,
            c: null
        };
    }
}
