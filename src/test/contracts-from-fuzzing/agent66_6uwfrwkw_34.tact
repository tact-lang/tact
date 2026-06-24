struct Deep {
    x: Int?;
    y: Int?;
}

contract ChainSet {
    deep: Deep;

    init() {
        self.deep = Deep{ x: null, y: 7 };
    }
}