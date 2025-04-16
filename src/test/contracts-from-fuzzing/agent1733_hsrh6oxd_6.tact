struct Data {
    a: Int;
    b: Int?;
    c: Int?;
    d: Int;
}

contract TestContract {
    d: Data;

    init() {
        self.d = Data{
            a: 1,
            b: null,
            c: 5,
            d: 7
        };
    }
}