struct Inner1 { x: Int; }
struct Inner2 { y: Bool; }
struct Inner3 { z: Int?; }

struct Container {
    f1: Inner1;
    f2: Inner2;
    f3: Inner3;
    opt: Inner1?;
}

contract MultiNestOption {
    data: Container;

    init() {
        self.data = Container{
            f1: Inner1{ x: 7 },
            f2: Inner2{ y: true },
            f3: Inner3{ z: null },
            opt: null,
        };
    }
}