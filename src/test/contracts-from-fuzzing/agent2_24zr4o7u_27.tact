struct Embedded {
    i: Int;
    b: Bool?;
    s: String?;
    a: Address;
    c: Cell?;
}

contract EmbedTest {
    field: Embedded;

    init() {
        self.field = Embedded{
            i: 5,
            b: null,
            s: null,
            a: myAddress(),
            c: null
        };
    }
}