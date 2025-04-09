struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
}

contract ManyOptionalsUse {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            a: null,
            b: 5,
            c: true,
            d: null,
            e: null,
        };
    }
}