struct Ints {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
}

contract MixInts {
    vals: Ints;
    
    init() {
        self.vals = Ints{
            a: 1,
            b: null,
            c: 3,
            d: 4,
        };
    }
}