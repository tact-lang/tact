struct S {
    a: Int = 1;
    b: Int?;
    c: Bool? = null;
}

contract TestContract {
    x: Int = 10;
    y: S;
    z: Bool;

    init() {
        self.z = true;
        self.y = S{b: null};
        self.x = 99;
    }
}