struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Cell?;
    e: Address?;
}

contract TestContract {
    vals: ManyOptionals;

    init() {
        self.vals = ManyOptionals{
            a: null,
            b: 5,
            c: true,
            d: null,
            e: null,
        };
    }

    receive() {
        let _ = self.vals.b;
    }
}