struct BaseA {
    x: Int;
}

struct BaseB {
    y: Int;
}

struct Container {
    a: BaseA;
    b: BaseB;
}

contract Contr {
    storage: Container;

    init() {
        self.storage = Container{
            a: BaseA{ x: 1 },
            b: BaseB{ y: 2 }
        };
    }
}