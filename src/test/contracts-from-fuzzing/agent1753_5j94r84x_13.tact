struct InnerStr {
    a: Int;
    b: Bool?;
}

struct OuterStr {
    inn: InnerStr?;
    x: Int;
}

contract AnotherDeepTest {
    s: OuterStr;
    init() {
        self.s = OuterStr{
            inn: null,
            x: 42,
        };
    }
}
