struct Inner {
    value: Int;
}

struct Outer {
    option: Inner?;
    regular: Int;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{
            option: null,
            regular: 42
        };
    }
}