struct Inner {
    x: Int = 1;
    y: Bool = true;
}

struct Outer {
    a: Int = 7;
    nested: Inner?;
}

contract NestedTest {
    data: Outer = Outer{ a: 100, nested: null };

    init() {
        self.data = Outer{
            a: 42,
            nested: Inner{ x: 5, y: false }
        };
    }

    receive() {
        dump(self.data.a);
        if (self.data.nested != null) {
            dump(self.data.nested!!.x);
            dump(self.data.nested!!.y);
        }
    }
}