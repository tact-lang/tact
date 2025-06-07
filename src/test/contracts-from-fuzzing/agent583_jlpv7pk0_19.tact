message(10) FooMsg { x: Int }

struct Inner {
    y: Int?;
    z: Bool?;
}

struct Combo {
    m: FooMsg?;
    s: Inner?;
    v: String?;
}

contract CombinedTest {
    combo: Combo;

    init() {
        self.combo = Combo{
            m: FooMsg{ x: 1 },
            s: Inner{ y: 2, z: null },
            v: null
        };
    }
}