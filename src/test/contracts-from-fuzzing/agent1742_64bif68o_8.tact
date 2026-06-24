struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    data: Inner?;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            data: Inner{
                x: 42,
                y: null,
            },
        };
    }
}