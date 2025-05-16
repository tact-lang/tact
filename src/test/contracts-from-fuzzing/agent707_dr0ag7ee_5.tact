struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    c: Inner?;
}

contract OptNested {
    data: Outer?;

    init() {
        self.data = Outer{
            c: Inner{
                a: 1,
                b: null,
            },
        };
    }
}