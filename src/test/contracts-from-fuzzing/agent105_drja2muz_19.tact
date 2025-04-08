struct X {
    a: Int;
    b: Bool?;
}

struct Y {
    q: String;
    optX: X?;
}

struct Z {
    y1: Y;
    y2: Y?;
}

contract TestContract {
    data: Z;

    init() {
        self.data = Z{
            y1: Y{q:"hello", optX:null},
            y2: null
        };
    }

    receive() {}
}