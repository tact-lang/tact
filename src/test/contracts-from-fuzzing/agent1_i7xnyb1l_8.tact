struct Data {
    val: Int;
    flag: Bool;
}

contract TestContract {
    dataOpt: Data?;

    init() {
        self.dataOpt = Data{
            val: 99,
            flag: true,
        };
    }
}