struct Data { a: Int; }

contract TestGetterDestructure {
    data: Data = Data { a: 5 };

    receive() {}

    get fun getA(): Int {
        let Data { a } = self.data;
        return a;
    }
}
