struct Base {
    x: Int;
}

struct Layer1 {
    b: Base;
    y: Int;
}

struct Layer2 {
    l1: Layer1;
    z: Int;
}

contract MultiLayered {
    val: Layer2;
    init() {
        self.val = Layer2{ l1: Layer1{ b: Base{ x:1 }, y:2 }, z:3 };
    }
}