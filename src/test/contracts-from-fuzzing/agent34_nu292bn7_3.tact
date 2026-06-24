struct Data {
    a: Int;
    b: Bool;
}

contract Test {
    data: Data = Data{a: 42, b: true};
    
    // required receive function for contract instantiation
    receive() {}

    // Getter function returning a struct
    get fun getData() : Data {
         return self.data;
    }
}
