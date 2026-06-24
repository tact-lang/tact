struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Address?;
    f: Cell?;
}

contract TestContract {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            a: null,
            b: 2,
            c: true,
            d: null,
            e: null,
            f: null,
        };
    }
}