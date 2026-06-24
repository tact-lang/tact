struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    l: Inner?;
    r: Inner?;
}

contract NullBranches {
    data: Outer;

    init() {
        self.data = Outer{
            l: null,
            r: null
        };
    }
}