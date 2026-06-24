struct AltOrder {
    x: Int;
    y: Bool;
    z: String;
    w: Address;
}

contract ReorderTest {
    a: AltOrder;
    init() {
        self.a = AltOrder{
            w: myAddress(),
            z: "str",
            y: true,
            x: 7,
        };
    }
}