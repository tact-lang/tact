struct AA {
    a: Int;
    b: Int;
}

struct BB {
    x: Int;
    y: AA;
    z: Bool;
}

struct CC {
    next: BB;
    done: Bool;
}

contract TestContract {
    field: CC;
    init() {
        self.field = CC{ next: BB{ x: 1, y: AA{ a: 2, b: 3 }, z: false }, done: true };
    }
}