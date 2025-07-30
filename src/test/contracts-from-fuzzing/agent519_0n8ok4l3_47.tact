struct IntSerials2 {
    a: Int as int5;
    b: Int as uint6;
}

contract IntSerials2Contract {
    data: IntSerials2;

    init() {
        self.data = IntSerials2 { a: 15, b: 43 };
    }
}