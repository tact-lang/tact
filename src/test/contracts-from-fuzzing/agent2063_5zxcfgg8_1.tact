struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract TestContract {
    coord: Outer;

    init() {
        self.coord = Outer{
            nested: Inner{
                x: 10,
                y: null,
            },
            flag: true,
        };
    }
}