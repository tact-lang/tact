struct Deep {
    x: Int;
    y: Bool;
}

struct Outer {
    z: Deep;
    flag: Bool;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            z: Deep{ x: 9, y: false },
            flag: true,
        };
    }
}