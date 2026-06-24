struct NestedS {
    inner: STest;
    flag: Bool;
}

struct STest {
    x: Int;
    y: String;
}

contract Test26 {
    v: NestedS;
    init() {
        self.v = NestedS{
            inner: STest{ x: 3, y: "z" },
            flag: true
        };
    }
}
