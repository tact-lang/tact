struct A { a: Int?; }
struct B { b: Int?; }
struct C { c: Int?; }

struct Container {
    x: A?;
    y: B?;
    z: C?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            x: null,
            y: null,
            z: null
        };
    }
}