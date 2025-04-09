struct Base {
    x: Int;
    y: Int;
}

struct Extended {
    base: Base;
    z: Int;
    w: Bool;
}

contract TestContract {
    val: Extended;

    init() {
        self.val = Extended{
            base: Base{ x: 1, y: 2 },
            z: 3,
            w: true
        };
    }
}