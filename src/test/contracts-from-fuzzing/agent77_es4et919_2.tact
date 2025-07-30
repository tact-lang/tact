struct Data {
    a: Int;
    flag: Bool;
}

contract CompositeGetter {
    data: Data;

    init() {
        self.data = Data { a: 42, flag: true };
    }

    receive() {}

    get fun getData(): Data {
        return self.data;
    }
}
