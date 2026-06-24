struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Int?;
    e: Bool?;
}

contract TestContract {
    state: ManyOptionals;

    init() {
        self.state = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}