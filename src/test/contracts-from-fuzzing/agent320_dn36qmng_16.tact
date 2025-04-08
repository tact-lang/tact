struct S {
    x: Int;
    y: String;
}

contract Test {
    a: S;
    b: S;

    init() {
        self.a = S{x:1, y:"one"};
        self.b = S{x:2, y:"two"};
    }
}