struct SimpleNested {
    x: Int;
    y: Int;
}

contract NestedStructContract {
    coord: SimpleNested;
    
    init() {
        self.coord = SimpleNested{ x: 1, y: 2 };
    }
}