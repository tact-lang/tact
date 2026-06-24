struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract ManyOptionalsTest {
    field: ManyOptionals;

    init() {
        self.field = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}
