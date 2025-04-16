struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Bool;
}

struct Inner3 {
    z: String;
}

struct Middle {
    a: Inner1;
    b: Inner2;
    c: Inner3;
}

struct Outer {
    m: Middle;
    count: Int;
}

contract DeepNestingTest {
    nested: Outer;

    init() {
        self.nested = Outer{
            m: Middle{
                a: Inner1{ x: 1 },
                b: Inner2{ y: false },
                c: Inner3{ z: "abc" },
            },
            count: 10,
        };
    }

    receive() {
        let _ = self.nested;
    }
}
