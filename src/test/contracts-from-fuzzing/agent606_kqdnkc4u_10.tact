struct Bag {
    x: Int;
    y: Bool;
}

contract Test {
    data: Bag;

    init() {
        self.data = Bag{ x: 5, y: true };
    }
}