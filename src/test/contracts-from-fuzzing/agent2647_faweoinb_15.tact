struct Deep {
    a: Int;
    b: Int?;
}

struct Mid {
    a: Deep;
    b: Deep?;
}

struct Shallow {
    a: Mid;
    b: Mid?;
}

contract Layered {
    data: Shallow;

    init() {
        self.data = Shallow{
            a: Mid{ a: Deep{a:1,b:2}, b:null },
            b: null
        };
    }
}