struct Data { v: Int; }

contract CopyStruct {
    a: Data;
    b: Data;

    init() {
        let temp = Data{ v: 42 };
        self.a = temp;
        self.b = temp;
    }
}