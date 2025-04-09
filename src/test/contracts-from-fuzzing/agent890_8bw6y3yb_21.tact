struct OddOrder {
    s: String;
    i: Int;
    b: Bool;
    optS: String?;
    optI: Int?;
    optB: Bool?;
}

contract Test {
    val: OddOrder;

    init() {
        self.val = OddOrder{
            s: "hello",
            i: 42,
            b: true,
            optS: null,
            optI: null,
            optB: null
        };
    }
}