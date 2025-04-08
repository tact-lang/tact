struct Part {
    v: Int;
}

struct Container {
    a: Part?;
    b: Part?;
    c: Part?;
}

contract TestContract {
    stuff: Container;

    init() {
        self.stuff = Container{
            a: Part{v:1},
            b: null,
            c: Part{v:3},
        };
    }
}