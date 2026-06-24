struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
    z: Int;
}

contract OrderingTest {
    data: B;

    init() {
        self.data = B{
            a: A{
                x: 10,
                y: 20,
            },
            z: 30,
        };
    }
}