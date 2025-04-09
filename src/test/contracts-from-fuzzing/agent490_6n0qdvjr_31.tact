struct InnerOdd {
    x: Int?;
    y: Int;
}

contract SwapOrder {
    data: InnerOdd;
    init() {
        self.data = InnerOdd{ x:null, y:42 };
    }
}