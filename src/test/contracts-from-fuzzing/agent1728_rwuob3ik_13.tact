struct Message1 {
    foo: Int;
}

struct Message2 {
    bar: String;
}

struct Container {
    m1: Message1;
    m2: Message2;
}

contract TestContract {
    big: Container;

    init() {
        self.big = Container{
            m1: Message1{ foo: 10 },
            m2: Message2{ bar: "hello" }
        };
    }
}