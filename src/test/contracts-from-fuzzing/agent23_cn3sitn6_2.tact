struct Deep {
    x: Int;
    y: Bool;
    z: Bool?;
    sub: InnerSub;
}

struct InnerSub {
    k: Int;
    flag: Bool?;
}

contract DeepNestedTest {
    data: Deep;

    init() {
        self.data = Deep{
            x: 10,
            y: true,
            z: null,
            sub: InnerSub{ k: 99, flag: null }
        };
    }
}