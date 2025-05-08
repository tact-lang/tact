struct Data {
    x: Int;
    y: Bool;
}

contract MultiSameStruct {
    first: Data;
    second: Data?;

    init() {
        self.first = Data{x: 1, y: true};
        self.second = Data{x: 2, y: false};
    }
}