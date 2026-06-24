struct Chain3 {
    one: Int;
    two: Int;
    three: Int;
}

contract Persist3 {
    a: Int;
    b: Bool;
    c: Chain3;

    init() {
        self.a = 100;
        self.b = false;
        self.c = Chain3{
            one: 1,
            two: 2,
            three: 3,
        };
    }
}