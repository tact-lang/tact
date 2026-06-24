struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Address?;
    f: Cell?;
}

contract TestContract {
    store: ManyOptionals;

    init() {
        self.store = ManyOptionals{
            a: null, b: 1, c: null, d: true, e: null, f: null
        };
    }
}