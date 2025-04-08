struct StrNested {
    s: String;
    optStr: String?;
}

struct Wrap {
    wrap: StrNested;
}

contract StrNestedTest {
    f: Wrap;

    init() {
        self.f = Wrap{
            wrap: StrNested{
                s: "hello",
                optStr: null
            }
        };
    }
}
