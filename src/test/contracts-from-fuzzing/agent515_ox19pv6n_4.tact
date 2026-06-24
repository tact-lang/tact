struct Inner {
    x: Int = 123;
    y: Bool?; // null default
}

struct Outer {
    foo: Int = 5;
    bar: Inner = Inner{};
}

contract Test {
    state: Outer = Outer{
        foo: 42,
        // bar: omitted entirely, should use Outer default with Inner defaults inside
    };

    receive() {
        let _x = self.state.bar.x;
        let _y = self.state.bar.y;
    }
}