struct BoolFirst {
    flag: Bool;
    num: Int;
}

contract TestContract {
    data: BoolFirst;

    init() {
        self.data = BoolFirst{
            flag: true,
            num: 99
        };
    }
}