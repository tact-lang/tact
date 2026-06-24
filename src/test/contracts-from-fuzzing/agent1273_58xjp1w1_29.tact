struct S {
    one: Int;
    two: Int;
}

contract Twice {
    x: S;
    y: S;

    init() {
        self.x = S{one:1, two:2};
        self.y = S{one:3, two:4};
    }
}