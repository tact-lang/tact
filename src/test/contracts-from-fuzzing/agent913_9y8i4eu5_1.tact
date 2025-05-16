struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    nested: Inner;
    z: Bool?;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Inner{
                x: 1,
                y: null
            },
            z: true
        };
    }
}