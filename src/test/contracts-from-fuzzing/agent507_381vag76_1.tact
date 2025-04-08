struct Inner {
    z: Int;
    y: Int?;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{z: 1, y: null};
    }
}