struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int;
}

struct Outer {
    x: Inner1;
    y: Inner2;
}

contract MultiNested {
    data: Outer;

    init() {
        self.data = Outer{
            x: Inner1{ a: 1 },
            y: Inner2{ b: 2 },
        };
    }
}