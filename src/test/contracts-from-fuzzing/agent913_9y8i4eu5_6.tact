struct Middle {
    x: Int;
}

struct Outer {
    foo: Middle?;
    bar: Int;
}

contract TestContract {
    state: Outer;
    init() {
        self.state = Outer{
            foo: Middle{
                x: 99
            },
            bar: 77
        };
    }
}