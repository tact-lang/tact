struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: String?;
}

contract OptTest {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            a: null,
            b: 2,
            c: null,
            d: true,
            e: "hello"
        };
    }
}