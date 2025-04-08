struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int;
}

struct Container {
    one: Inner1;
    two: Inner2;
}

contract MultiInner {
    c: Container;
    init() {
        self.c = Container{
            one: Inner1{ a: 1 },
            two: Inner2{ b: 2 }
        };
    }
}