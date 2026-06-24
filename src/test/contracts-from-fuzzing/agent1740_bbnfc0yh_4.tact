struct Inner {
    a: Int;
    b: Bool;
    c: Int?;
}

struct Outer {
    m: Inner;
    n: Inner;
}

contract DeepNested {
    data: Outer = Outer{
        m: Inner{a: 1, b: true, c: null},
        n: Inner{a: 2, b: false, c: 3}
    };

    init() {
        self.data = Outer{
            m: Inner{a: 10, b: false, c: null},
            n: Inner{a: 20, b: true, c: 30}
        };
    }
}