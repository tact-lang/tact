struct Data {
    count: Int;
    flag: Bool;
}

contract TestContract {
    count: Int = 5;
    data: Data;

    init() {
        self.data = Data{
            count: 10,
            flag: true
        };
    }
}