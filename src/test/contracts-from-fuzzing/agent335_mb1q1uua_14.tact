struct Params1 {
    a: Int;
}

struct Params2 {
    b: String;
}

contract ManyStructFields {
    p1: Params1;
    p2: Params2;
    x: Int;
    y: Bool;

    init() {
        self.p1 = Params1{a:1};
        self.p2 = Params2{b:"hi"};
        self.x = 2;
        self.y = false;
    }
}