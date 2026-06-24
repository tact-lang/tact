struct X {
    y: Int?;
}

contract TopOptional {
    s: X?;

    init() {
        self.s = X{ y: null };
    }
}
