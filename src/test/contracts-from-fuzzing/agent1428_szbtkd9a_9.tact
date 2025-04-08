struct A {
    x: Int;
    y: Bool;
}

struct B {
    s: String;
    n: Int?;
}

struct Container {
    a: A;
    b: B;
}

contract TestContract {
    store: Container;

    init() {
        self.store = Container{
            a: A{ x: 10, y: false },
            b: B{ s: "hello", n: null }
        };
    }
}