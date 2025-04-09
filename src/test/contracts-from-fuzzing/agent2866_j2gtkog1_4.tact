struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
}

contract OptionalStructTest {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: 1,
            b: null,
            c: null,
            d: null,
            e: true,
        };
    }

    receive() {}
}