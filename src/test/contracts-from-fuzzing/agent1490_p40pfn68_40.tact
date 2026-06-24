struct SOpt {
    a: Int?;
    b: Bool?;
}

contract NestedManyOptionals {
    s: SOpt;

    init() {
        self.s = SOpt{
            a: null,
            b: null
        };
    }
}