struct AltOrder {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract AltOrderTest {
    val: AltOrder;

    init() {
        self.val = AltOrder{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "hi",
            f: null,
        };
    }
}