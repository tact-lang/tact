struct Tuple3 {
    item0: Int;
    item1: Int;
    item2: Int;
}

contract Test {
    data: Tuple3;

    init() {
        self.data = Tuple3{ item0: 10, item1: 20, item2: 30 };
    }
}