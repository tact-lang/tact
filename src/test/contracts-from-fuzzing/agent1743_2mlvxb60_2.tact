struct Inner {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract C {
    data: Inner?;

    init() {
        self.data = null;
    }
}