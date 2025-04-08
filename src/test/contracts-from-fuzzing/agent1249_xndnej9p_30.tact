struct Data {
    a: Int;
    b: Bool;
    c: Int?;
}

contract OptionalMix {
    data: Data?;

    init() {
        self.data = null;
    }
}