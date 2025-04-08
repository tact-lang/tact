struct Middle {
    a: Int;
    b: Bool?;
}

struct Outer {
    mid: Middle?;
}

contract NullableMidTest {
    top: Outer;

    init() {
        self.top = Outer {
            mid: null
        };
    }
}
