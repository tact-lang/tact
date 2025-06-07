struct InnerMost {
    a: Int;
    b: String;
}

struct Middle {
    x: Int;
    y: InnerMost;
    z: String?;
}

struct Outer {
    inner: Middle;
    flag: Bool;
}

contract ComplexNested {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Middle{
                x: 3,
                y: InnerMost{
                    a: 1,
                    b: "foo"
                },
                z: "bar"
            },
            flag: true
        };
    }
}