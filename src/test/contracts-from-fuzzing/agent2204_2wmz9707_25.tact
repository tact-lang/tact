contract InitAsStruct {
    data: Data; 
    init() {
        self.data = Data{value: 5, text: "hello"};
    }
}

struct Data {
    value: Int;
    text: String;
}
