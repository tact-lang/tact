struct Middle {
    value: Int;
    nested: Bottom;
}

struct Bottom {
    a: Int;
    b: Bool;
}

contract TestContract {
    a: Int;
    top: Middle;
    str: String;
    b: Bool;

    init() {
        self.a = 1;
        self.top = Middle{ value: 10, nested: Bottom{ a: 2, b: false } };
        self.str = "hi";
        self.b = true;
    }
}
