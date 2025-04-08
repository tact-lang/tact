struct SOptNum {
    a: Int?;
    b: Int?;
    c: Int?;
}

struct Complex {
    first: SOptNum;
    second: SOptNum;
    third: SOptNum;
}

contract ManyOptNums {
    val: Complex;

    init() {
        self.val = Complex{
            first: SOptNum{ a: 1, b: null, c: 3 },
            second: SOptNum{ a: null, b: 2, c: null },
            third: SOptNum{ a: null, b: null, c: null }
        };
    }
}