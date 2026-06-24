struct A {
    x: Int;
}

struct B {
    a1: A;
    a2: A;
    a3: A;
    a4: A;
}

contract RepeatStructs {
    data: B;

    init() {
        self.data = B{
            a1: A{ x: 1 },
            a2: A{ x: 2 },
            a3: A{ x: 3 },
            a4: A{ x: 4 }
        };
    }
}