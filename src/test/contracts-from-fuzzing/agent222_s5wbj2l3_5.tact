struct Inner1 {
    x: Int;
    y: Bool?;
}

struct Inner2 {
    s: String;
    sub: Inner1?;
}

struct Container {
    a: Inner2?;
    b: Int;
}

contract OptionalNestedTest {
    content: Container;

    init() {
        self.content = Container{
            a: null,
            b: 5
        };
    }
}