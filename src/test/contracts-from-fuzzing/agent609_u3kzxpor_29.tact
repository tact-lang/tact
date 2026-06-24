trait TA { foo: Int; }
trait TB { bar: Bool; }

struct Both {
    foo: Int;
    bar: Bool;
}

contract MultiInit with TA, TB {
    foo: Int;
    bar: Bool;

    init() {
        self.foo = 100;
        self.bar = false;
    }
}
