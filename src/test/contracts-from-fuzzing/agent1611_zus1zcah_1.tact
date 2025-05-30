struct SimpleNested {
    x: Int;
    y: Int?;
}

contract Test {
    data: SimpleNested;

    init() {
        self.data = SimpleNested{
            x: 1,
            y: null
        };
    }
}