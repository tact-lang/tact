struct A { x: Int }
struct B { y: Int }

struct Container {
    one: A?;
    two: B?;
    three: Int?;
}

contract Main {
    c: Container;

    init() {
        self.c = Container{
            one: null,
            two: null,
            three: null
        };
    }
}