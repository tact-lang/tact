struct DeepOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Inner?
}

struct Inner {
    x: Int?;
    y: Bool?;
}

contract ManyOptionals {
    m: DeepOptional;
    init() {
        self.m = DeepOptional{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}