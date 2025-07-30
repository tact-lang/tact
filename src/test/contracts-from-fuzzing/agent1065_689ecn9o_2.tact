struct Deep {
    a: Int;
    b: Bool;
}

struct Middle {
    x: Deep;
    y: Bool;
}

struct Outer {
    m: Middle;
    flag: Bool;
}

contract DeepNestedTest {
    val: Outer;
    init() {
        self.val = Outer{
            m: Middle{
                x: Deep{ a: 1, b: true },
                y: false
            },
            flag: true
        };
    }
}