struct Data {
    a: Int as uint8;
    b: Int as int16;
    c: Int;
}

contract TestContract {
    int8: Int as uint8 = 1;
    int16: Int as int16 = 2;
    defaultInt: Int = 3;

    data: Data;

    init() {
        self.data = Data{ a: 4, b: 5, c: 6 };
    }
}