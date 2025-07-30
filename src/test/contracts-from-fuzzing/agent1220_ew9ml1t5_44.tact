struct A { x: Int }
struct B { y: Int }
struct Container {
    a: A;
    b: B;
}

contract MultipleStructs {
    data: Container;

    init() {
        self.data = Container{
            a: A{ x: 1 },
            b: B{ y: 2 }
        };
    }
}