struct Deep {
    level1: Inner1;
}

struct Inner1 {
    level2: Inner2;
}

struct Inner2 {
    x: Int;
    y: Int?;
    z: Bool;
}

contract Test {
    d: Deep;
    init() {
        self.d = Deep{
            level1: Inner1{
                level2: Inner2{ x: 1, y: null, z: true }
            }
        };
    }
}