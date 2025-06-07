struct A { x: Int }
struct B { y: A }
struct C { z: B }

struct Container {
    item: C;
}

contract TestContract {
    member: Container;

    init() {
        self.member = Container{
            item: C{ z: B{ y: A{ x: 123 } } }
        };
    }
}