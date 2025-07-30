struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer {
            nested: Inner { x: 5, y: false },
            flag: true
        };
    }

    receive() {
        dump(self.data.nested.x);
        dump(self.data.nested.y);
        dump(self.data.flag);
    }
}
