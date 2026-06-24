struct Inner {
    s: String?;
    n: Int?;
}

struct Outer {
    x: Inner;
    y: Inner;
}

contract NestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            x: Inner{s:null, n:null},
            y: Inner{s:"hi", n:5},
        };
    }
}