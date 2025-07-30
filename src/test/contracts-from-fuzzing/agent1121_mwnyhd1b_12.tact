struct Data {
    number: Int;
    flag: Bool;
}

contract MultiStructs {
    first: Data;
    second: Data;

    init() {
        self.first = Data{
            number: 1,
            flag: true,
        };
        self.second = Data{
            number: 2,
            flag: false,
        };
    }
}