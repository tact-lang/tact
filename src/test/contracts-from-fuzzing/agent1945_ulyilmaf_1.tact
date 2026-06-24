struct Inner1 { a: Int; b: Bool; }

contract TestContract {
    x: Inner1;
    y: Int;
    z: Bool;

    init() {
        self.x = Inner1{a: 1, b: true};
        self.y = 42;
        self.z = false;
    }
}