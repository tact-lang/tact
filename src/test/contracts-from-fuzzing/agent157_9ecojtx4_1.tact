struct DeepNested {
    a: Int;
    b: Inner1;
}

struct Inner1 {
    c: Int;
    d: Inner2;
}

struct Inner2 {
    e: Bool;
    f: Inner3;
}

struct Inner3 {
    g: String;
    h: Int?;
}

contract DeepNestedTest {
    s: DeepNested;

    init() {
        self.s = DeepNested{
            a: 1,
            b: Inner1{
                c: 2,
                d: Inner2{
                    e: true,
                    f: Inner3{
                        g: "test",
                        h: null
                    }
                }
            }
        };
    }
}
