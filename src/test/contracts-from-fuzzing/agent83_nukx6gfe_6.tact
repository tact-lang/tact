struct Data {
    a: Int;
    b: Bool;
}

contract TestStruct {
    data: Data = Data{ a: 10, b: true };

    receive() {}

    get fun getData(): Data {
         return self.data;
    }
}
