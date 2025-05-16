struct Inner1 { a: Int; b: Bool; }
struct Inner2 { c: Int?; d: String; }

struct Outer {
    s1: Inner1;
    s2: Inner2;
}

contract DeepNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            s1: Inner1{a: 1, b: true},
            s2: Inner2{c: null, d: "hello"},
        };
    }
}