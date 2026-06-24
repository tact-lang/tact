struct Data {
    val: Int?;
}

contract NullNestedOpt {
    data: Data?;

    init() {
        self.data = null;
    }
}