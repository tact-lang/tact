struct MixOrder {
    s: String;
    b: Bool;
    i: Int;
}

contract MixOrderTest {
    val: MixOrder;

    init() {
        self.val = MixOrder{
            s: "x",
            b: true,
            i: 42,
        };
    }
}