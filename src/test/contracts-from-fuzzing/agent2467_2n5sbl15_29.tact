struct Data { i: Int; }

contract NullStructOption {
    data: Data?;
    init() {
        self.data = null;
    }
}