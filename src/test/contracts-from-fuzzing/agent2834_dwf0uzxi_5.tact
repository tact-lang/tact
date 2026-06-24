struct Simple {
    x: Int;
    y: Int;
    z: String;
}

contract ManySimpleFields {
    a: Simple;
    b: Simple;
    c: Simple;
    d: Simple;

    init() {
        self.a = Simple{ x: 1, y: 2, z: "a" };
        self.b = Simple{ x: 3, y: 4, z: "b" };
        self.c = Simple{ x: 5, y: 6, z: "c" };
        self.d = Simple{ x: 7, y: 8, z: "d" };
    }
}