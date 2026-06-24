struct A {
    x: Int?;
}

struct B {
    y: A;
}

contract OptionalInner {
    data: B;

    init() {
        self.data = B{
            y: A{
                x: null
            }
        };
    }
}
