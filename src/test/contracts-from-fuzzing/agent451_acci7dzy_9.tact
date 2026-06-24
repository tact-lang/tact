struct LargeNested {
    n1: Nested1;
    n2: Nested2;
}

struct Nested1 {
    a: Int;
    b: Bool;
}

struct Nested2 {
    c: Int;
    d: Bool;
    e: String;
}

contract LargeNestedTest {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            n1: Nested1{ a:1, b:true },
            n2: Nested2{ c:2, d:false, e:"hi" },
        };
    }
}