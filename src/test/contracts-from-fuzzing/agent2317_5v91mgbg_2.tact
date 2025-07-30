struct Outer {
    n: Int = 0;
    flag: Bool = false;
    nested: Inner;
}

struct Inner {
    x: Int = 1;
    y: Bool = true;
}

contract DeepNested {
    outer: Outer;

    init() {
        self.outer = Outer{
            n: 42,
            flag: true,
            nested: Inner{x: 5, y: false}
        };
    }
}