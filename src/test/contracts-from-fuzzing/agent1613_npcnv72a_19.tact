struct Deep {
    x: Bool?;
    y: Int?;
}

struct Mid {
    a: Deep;
    b: Bool;
}

contract MidOptional {
    opt: Mid?;

    init() {
        self.opt = Mid{
            a: Deep{x:null,y:null},
            b: true
        };
    }
}
