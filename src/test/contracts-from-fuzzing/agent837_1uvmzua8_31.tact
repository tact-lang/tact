struct A { b: Int; }

contract ImplicitDefaults {
    x: Int;
    y: Bool;
    z: String;
    s: A;
    init() {
        self.x = 1;
        self.y = true;
        self.z = "z";
        self.s = A{ b: 42 };
    }
}