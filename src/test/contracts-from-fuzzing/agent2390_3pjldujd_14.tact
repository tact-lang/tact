struct Container {
    content: Inner;
}

struct Inner {
    id: Int;
    flag: Bool;
    text: String;
}

contract NestedContainer {
    c: Container;
    init() {
        self.c = Container{
            content: Inner{ id: 1, flag: true, text: "hello" },
        };
    }
}