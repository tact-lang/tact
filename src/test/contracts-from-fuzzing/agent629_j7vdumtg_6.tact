struct InnerMost {
    a: Int;
    b: String;
}

struct Middle {
    x: Int;
    y: InnerMost;
}

struct Outer {
    foo: Middle;
    bar: Bool;
}

contract MultiNested {
    data: Outer;

    init() {
        self.data = Outer{
            foo: Middle{
                x: 123,
                y: InnerMost{
                    a: 10,
                    b: "deep"
                }
            },
            bar: true
        };
    }
}