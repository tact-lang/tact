struct A { x: Int }

contract DefaultedPrimitive {
    z: Int = 5;
    y: Bool = true;
    a: A = A{x: 10};

    init() {
        self.z = 42;
        self.y = false;
        self.a = A{x:99};
    }
}