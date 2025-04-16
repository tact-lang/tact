struct Data {
    a: Int;
    b: Bool;
}

contract TestStruct {
    data: Data = Data { a: 123, b: true };
    
    receive() {}
    
    get fun getData(): Data {
        return self.data;
    }
}
