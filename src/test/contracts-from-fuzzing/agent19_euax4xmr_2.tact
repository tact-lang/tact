struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    foo: Int;
    bar: Inner?; 
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            foo: 10,
            bar: Inner{
                x: 1,
                y: true,
            },
        };
    }
}