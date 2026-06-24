struct Inner {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalNested {
    data: Inner?;

    init() {
        self.data = Inner{x: null, y: true, z: null};
    }
}
