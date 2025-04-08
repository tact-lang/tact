struct Inner {
    a: Int;
    b: String;
}

contract MultiStructs {
    x: Inner;
    y: Inner;

    init() {
        self.x = Inner{ a:1, b:"one" };
        self.y = Inner{ a:2, b:"two" };
    }
}