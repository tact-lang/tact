struct AA {
    x: Int?
}

contract StructInOption {
    a: AA?;

    init() {
        self.a = null;
    }
}
