struct A {
    aa: Int?;
    ab: Bool;
}

struct B {
    ba: A?;
    bb: Bool;
}

contract OptionalDepth {
    deep: B;

    init() {
        self.deep = B{
            ba: A{
                aa: null,
                ab: true,
            },
            bb: false,
        };
    }
}