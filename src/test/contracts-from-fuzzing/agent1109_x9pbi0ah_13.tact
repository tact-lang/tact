struct BoolIntStr {
    b: Bool;
    i: Int;
    s: String;
}

contract DifferentOrderTest {
    data: BoolIntStr;

    init() {
        self.data = BoolIntStr{
            b: false,
            i: 42,
            s: "different"
        };
    }
}