struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
    f: Bool?;
}

contract TestContract {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            a: 1,
            b: false,
            c: 2,
            d: true,
            e: 3,
            f: null
        };
    }
}