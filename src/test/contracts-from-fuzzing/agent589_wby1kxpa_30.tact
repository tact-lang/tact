message(1) MOne { x: Int }
message(2) MTwo { y: Int }

struct Container {
    a: MOne;
    b: MTwo;
}

contract Test {
    v: Container;

    init() {
        self.v = Container{
            a: MOne{ x: 5 },
            b: MTwo{ y: 6 },
        };
    }
}