struct A {
    x: Int;
    y: Bool;
}

struct B {
    p: String;
    q: Int?;
}

struct Container {
    a: A?;
    b: B?;
}

contract TestContract {
    c: Container;
    init() {
        self.c = Container{
            a: A{ x: 1, y: false },
            b: null,
        };
    }
}