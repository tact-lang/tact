struct Fusion {
    a: Int;
    b: Int?;
    c: String;
    d: Bool;
    e: String?;
    f: Bool?;
}

contract FusionTest {
    data: Fusion;

    init() {
        self.data = Fusion{
            a: 5,
            b: null,
            c: "str",
            d: true,
            e: null,
            f: false,
        };
    }
}
