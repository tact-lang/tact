struct WeirdSizes {
    a: Int as int7;
    b: Int as uint3;
    c: Int as uint11;
}

contract UnevenSerialization {
    data: WeirdSizes;

    init() {
        self.data = WeirdSizes{ a: 5, b: 3, c: 100 };
    }
}