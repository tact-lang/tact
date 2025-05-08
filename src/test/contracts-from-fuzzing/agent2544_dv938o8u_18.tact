struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Int;
}

struct Container {
    a: Inner1;
    b: Inner2;
}

contract ContainerTest {
    val: Container;
    init() {
        self.val = Container{
            a: Inner1{ x: 5 },
            b: Inner2{ y: 10 }
        };
    }
}