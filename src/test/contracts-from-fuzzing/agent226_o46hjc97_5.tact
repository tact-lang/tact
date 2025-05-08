struct Deep1 {
    x: Int?;
    y: Bool;
}

struct Deep2 {
    z: Deep1?;
    t: Int;
}

struct Deep3 {
    w: Deep2?;
}

contract DeepOptionalTest {
    data: Deep3;

    init() {
        self.data = Deep3{
            w: Deep2{
                z: Deep1{ x: null, y: true },
                t: 42
            }
        };
    }
}
