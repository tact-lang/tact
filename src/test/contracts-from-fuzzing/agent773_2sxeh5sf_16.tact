struct WeirdInts {
    a: Int as int5;
    b: Int as uint7;
}

contract WeirdPersist {
    w: WeirdInts = WeirdInts{ a: 15, b: 100 };

    init() {
        self.w = WeirdInts{ a: -5, b: 50 };
    }

    receive() {}
}