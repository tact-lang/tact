struct A {
    x: Int;
    y: Int?;
}

struct B {
    aa: A;
    bb: Int?;
}

contract DeepOpt {
    data: B;

    init() {
        self.data = B{
            aa: A{ x: 10, y: null },
            bb: null
        };
    }
}