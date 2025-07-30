struct Deep {
    s1: Struct1;
    s2: Struct2;
}

struct Struct1 {
    x: Int;
    y: Bool;
}

struct Struct2 {
    z: Int;
}

contract TestContract {
    deep: Deep;
    init() {
        self.deep = Deep{
            s1: Struct1{ x: 5, y: true },
            s2: Struct2{ z: 10 },
        };
    }
}