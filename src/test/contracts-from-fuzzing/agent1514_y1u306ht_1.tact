struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    x: Int = 1;
    y: Bool = false;
    z: Inner = Inner{a: 5, b: true};
    
    init() {
        self.x = 10;
        self.y = true;
        self.z = Inner{a: 20, b: false};
    }
}