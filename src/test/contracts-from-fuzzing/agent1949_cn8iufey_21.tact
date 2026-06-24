struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract MultiLayerOptionals {
    x: SOpt?;
    y: SOpt?;

    init() {
        self.x = null;
        self.y = null;
    }
}
