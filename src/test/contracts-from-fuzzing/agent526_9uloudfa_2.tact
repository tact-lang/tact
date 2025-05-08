struct Embedded {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
}

contract EmbedTest {
    val: Embedded;

    init() {
        self.val = Embedded{
            a: 10,
            b: false,
            c: "xxx",
            d: emptyCell(),
            e: myAddress(),
        };
    }

    receive() {}
}