struct Data {
    x: Int;
    y: Int;
}

contract TestStruct {
    d: Data = Data { x: 10, y: 20 };

    receive() {}

    get fun getData(): Data {
        return self.d;
    }
}
