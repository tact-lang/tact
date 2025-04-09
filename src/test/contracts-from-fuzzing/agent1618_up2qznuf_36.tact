struct MinMaxInt {
    min: Int as int1;
    max: Int as int257;
}

contract MinMaxStore {
    data: MinMaxInt;

    init() {
        self.data = MinMaxInt{min: 1, max: -1};
    }
}