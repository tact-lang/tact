struct Deep {
    a: Int;
    b: Int;
}

contract MultiAssign {
    first: Deep;
    second: Deep;

    init() {
        self.first = Deep{a:1,b:2};
        self.second = Deep{a:3,b:4};
    }
}