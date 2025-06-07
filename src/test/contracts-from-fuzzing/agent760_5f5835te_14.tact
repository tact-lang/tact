struct Inner {
    x: Int = 5;
    y: Bool = true;
}

struct Outer {
    a: String = "hello";
    b: Inner;
}

contract DefaultsPropagation {
    s: Outer = Outer{
        b: Inner{},
    };

    init() {
        self.s = Outer{
            a: "init",
            b: Inner{},
        };
    }
}