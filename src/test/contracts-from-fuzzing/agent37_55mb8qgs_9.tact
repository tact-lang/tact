struct Container {
    x: Int;
    y: Int;
}

contract FieldOrderTest {
    b: Int;
    a: Container;
    c: Int;

    init() {
        self.b = 1;
        self.a = Container{ x:10, y:20 };
        self.c = 2;
    }
}
