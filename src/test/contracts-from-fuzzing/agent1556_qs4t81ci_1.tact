struct Inner {
    z: Int = 7;
}

contract TestContract {
    x: Int = 1;
    y: Inner = Inner{};

    init() {
        self.x = 42;
        self.y = Inner{z: 100};
    }

    receive() {
        let _ = self.x + self.y.z;
    }
}