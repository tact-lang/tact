struct A {
    x: Int;
    y: Bool;
}

struct B {
    p: A;
    q: A;
}

contract HasStructs {
    data: B;

    init() {
        self.data = B{
            p: A{ x: 1, y: true },
            q: A{ x: 2, y: false }
        };
    }
}