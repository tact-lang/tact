struct Inner {
    x: Int;
    y: Bool;
    z: String;
    opt: Int?;
}

contract TestContract {
    s: Inner = Inner{x: 1, y: true, z: "hi", opt: null};

    init() {
        self.s = Inner{x: 10, y: false, z: "bye", opt: 1};
    }

    receive() {
        dump(self.s.x);
    }
}