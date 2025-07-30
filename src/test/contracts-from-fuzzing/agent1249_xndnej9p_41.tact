struct X {
    a: Int;
    b: Int;
}

contract StructMultiple {
    one: X;
    two: X;

    init() {
        self.one = X{a:1,b:2};
        self.two = X{a:3,b:4};
    }
}