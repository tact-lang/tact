struct Inner {
    x: Int;
    y: Int?;
}

contract TestContract {
    coords: Inner;
    count: Int;
    flag: Bool;

    init() {
        self.coords = Inner{x: 1, y: null};
        self.count = 0;
        self.flag = false;
    }
}