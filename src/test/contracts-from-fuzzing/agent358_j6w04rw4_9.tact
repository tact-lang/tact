struct Sub1 {
    a: Int;
}
struct Sub2 {
    b: Int;
}

struct Container {
    sub1: Sub1;
    sub2: Sub2;
}

contract MultiNest {
    field: Container;

    init() {
        self.field = Container{
            sub1: Sub1{ a: 1 },
            sub2: Sub2{ b: 2 }
        };
    }
}