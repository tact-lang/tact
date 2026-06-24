struct A { x: Int; }
struct B { y: Int; }
struct Container {
    a: A;
    b: B;
    flag: Bool;
}

contract Test {
    c: Container;

    init() {
        self.c = Container{
            a: A{ x: 5 },
            b: B{ y: 7 },
            flag: true
        };
    }
}