struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    c: String;
    nested: Inner;
}

contract TestContract {
    outerData: Outer;
    init() {
        self.outerData = Outer{
            c: "hello",
            nested: Inner{
                a: 11,
                b: true
            }
        };
    }
}