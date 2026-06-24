struct Compose {
    x: Int;
    y: Bool;
}

contract TypedOrder {
    a: Compose;
    b: Int;
    c: Bool;

    init() {
        self.a = Compose{ x:1, y:true };
        self.b = 2;
        self.c = false;
    }
}