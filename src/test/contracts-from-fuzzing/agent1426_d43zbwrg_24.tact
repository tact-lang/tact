struct X {
    v1: Int; v2: Int; v3: Int;
}

contract MultiAssign {
    data: X;

    init() {
        self.data = X{ v1:1, v2:2, v3:3 };
    }
}