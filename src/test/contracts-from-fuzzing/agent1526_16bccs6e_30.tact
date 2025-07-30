struct TwoLevels {
    inner1: Int;
    inner2: Bool;
}

contract StructStorage {
    data: TwoLevels;

    init() {
        self.data = TwoLevels{
            inner1: 42,
            inner2: true,
        };
    }
}