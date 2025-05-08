struct Inner {
    n: Int;
    optB: Bool?;
    optS: String?;
}

contract OptionalNested {
    data: Inner?;

    init() {
        self.data = null;
    }
}
