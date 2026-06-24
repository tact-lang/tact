struct L1 {
    v: Int;
    sub: L2;
}

struct L2 {
    b: Bool;
    subsub: L3;
}

struct L3 {
    s: String;
    flag: Bool;
}

contract NestedLevelsTest {
    data: L1;

    init() {
        self.data = L1{
            v: 42,
            sub: L2{
                b: true,
                subsub: L3{
                    s: "deep",
                    flag: false
                }
            }
        };
    }
}
