struct LargeNested {
    a1: Inner;
    a2: Inner;
    a3: Inner;
    a4: Inner;
    a5: Inner;
}

struct Inner {
    x: Int;
    y: String;
    z: Bool;
}

contract TestContract {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a1: Inner{ x: 1, y: "1", z: true },
            a2: Inner{ x: 2, y: "2", z: false },
            a3: Inner{ x: 3, y: "3", z: true },
            a4: Inner{ x: 4, y: "4", z: false },
            a5: Inner{ x: 5, y: "5", z: true }
        };
    }
}