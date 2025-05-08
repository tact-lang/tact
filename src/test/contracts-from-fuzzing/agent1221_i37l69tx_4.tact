struct Atomic {
    x: Int;
    y: Bool;
    z: String;
}

contract AtomicList {
    a: Atomic;
    b: Atomic;
    c: Atomic;

    init() {
        self.a = Atomic{ x: 1, y: true, z: "a" };
        self.b = Atomic{ x: 2, y: false, z: "b" };
        self.c = Atomic{ x: 3, y: true, z: "c" };
    }
}