struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Complex {
    flag: Bool;
    num: Int as uint32;
    optionalFlag: Bool?;
    optionalNum: Int?;
    nestedPoint: Point;
}

contract Test {
    storage: Complex;

    init() {
        self.storage = Complex{
            flag: true,
            num: 10,
            optionalFlag: null,
            optionalNum: null,
            nestedPoint: Point{ x: 2, y: 3 },
        };
    }
}