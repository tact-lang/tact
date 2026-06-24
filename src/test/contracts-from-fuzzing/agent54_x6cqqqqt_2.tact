struct Inner {
    b: String;
}

struct Middle {
    a: Int;
    nested: Inner;
}

struct Outer {
    c: Bool;
    middle: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            c: true,
            middle: Middle{
                a: 42,
                nested: Inner{
                    b: "hello"
                }
            }
        };
    }
}