struct FinalOptInt {
    a: Int?;
}

contract NullFinalOptInt {
    x: FinalOptInt;
    init() {
        self.x = FinalOptInt{a: null};
    }
}