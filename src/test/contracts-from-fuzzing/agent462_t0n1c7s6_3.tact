struct Deep {
    a: Int;
    next: DeepOptional;
}

struct DeepOptional {
    b: Int?;
    next: DeepOptional2?;
}

struct DeepOptional2 {
    c: Bool?;
}

contract DeepNest {
    s: Deep;

    init() {
        self.s = Deep{
            a: 5,
            next: DeepOptional{
                b: null,
                next: DeepOptional2{
                    c: true
                }
            }
        };
    }
}