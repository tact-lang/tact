struct L3 {
    a: Int = 7;
    b: Bool? = null;
}

struct L2 {
    x: Int;
    y: L3;
}

struct L1 {
    inner: L2;
    text: String?;
}

contract NestedHybrid {
    st: L1;

    init() {
        self.st = L1{
            inner: L2{
                x: 5,
                y: L3{ a: 9, b: true },
            },
            text: "nested",
        };
    }
}