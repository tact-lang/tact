struct Foo {
    x: Int = 1;
    y: Bool = true;
}

contract ManyOptionalsOfStructs {
    a: Foo? = null;
    b: Foo? = null;
    c: Foo? = null;

    init() {
        self.a = Foo{ x: 11, y: false };
        self.b = null;
        self.c = Foo{ x: 22, y: true };
    }
    receive(){}
}