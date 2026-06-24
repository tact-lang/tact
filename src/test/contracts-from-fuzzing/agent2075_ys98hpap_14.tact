struct Deep {
    a: Int;
    b: Bool;
}

contract OptStructNull {
    data: Deep?;

    init() {
        self.data = null;
    }
}