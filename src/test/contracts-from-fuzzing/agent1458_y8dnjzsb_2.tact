struct Inner {
    x: Int = 0;
    y: Bool = true;
}

struct Outer {
    foo: Inner;
    bar: Int?; 
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            foo: Inner{ x: 1, y: false },
            bar: null,
        };
    }
}