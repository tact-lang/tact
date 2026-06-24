struct Data {
    a: Int;
    b: String?;
}

contract Test {
    myData: Data;

    init() {
        self.myData = Data { a: 7, b: null };
    }
}