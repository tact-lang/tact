struct Inner1 { x:Int }
struct Inner2 { y:Int }
struct Inner3 { z:Int }

struct Container {
    f1: Inner1;
    f2: Inner2;
    f3: Inner3;
}

contract Test {
    big: Container;

    init() {
        self.big = Container{
            f1: Inner1{ x:1 },
            f2: Inner2{ y:2 },
            f3: Inner3{ z:3 }
        };
    }
}