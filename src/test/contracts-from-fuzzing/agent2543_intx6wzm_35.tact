struct Simple {
    a: Int;
    b: Bool;
}

struct Wrapped {
    inner: Simple;
    opt: Simple?;
    msg: String;
}

contract WrapTest {
    data: Wrapped;
    init() {
        self.data = Wrapped {
            inner: Simple { a: 1, b: false },
            opt: null,
            msg: "Hello"
        };
    }
}