struct Innermost {
    f1: Int as uint8;
    f2: Bool?;
}

struct Middle {
    nested: Innermost;
    s: String?;
}

struct Outer {
    inner: Middle;
}

contract ComboTest {
    data: Outer;

    init() {
        self.data = Outer {
            inner: Middle {
                nested: Innermost {
                    f1: 15,
                    f2: true,
                },
                s: null,
            },
        };
    }
}