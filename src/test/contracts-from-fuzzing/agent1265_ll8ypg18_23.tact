struct Inner {
    a: Int;
}

struct Outer {
    b: Int;
    nested: Inner;
}

contract DefaultInit {
    data: Outer;

    init() {
        self.data = Outer{
            b: 1,
            nested: Inner{
                a: 2
            }
        };
    }
}