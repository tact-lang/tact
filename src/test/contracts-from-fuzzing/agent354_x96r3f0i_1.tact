struct InnerOne { x: Int; y: Int; }

contract SingleStructField {
    coords: InnerOne;

    init() {
        self.coords = InnerOne{ x: 1, y: 2 };
    }
}
