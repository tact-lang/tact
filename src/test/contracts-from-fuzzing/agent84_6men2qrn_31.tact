struct A {
    a: Int?;
}

struct B {
    b: A?;
}

contract ABOpt {
    data: B;

    init() {
        self.data = B{
            b: null,
        };
    }
}