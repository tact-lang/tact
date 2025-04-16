struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    a: Int;
    i: Inner;
}

contract DeepUpdate {
    data: Outer;

    init() {
        self.data = Outer{ a:1, i:Inner{ x:2, y:true } };
    }

    receive() {
        self.data.i.x = 100;
        self.data.i.y = false;
        self.data.a = 999;
    }
}
