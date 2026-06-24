struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptionalTest {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: null
        };
    }
}
