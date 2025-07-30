struct Child {
    s: String;
    b: Bool;
}

struct Parent {
    a: Int;
    child: Child;
}

contract StringBoolInt {
    data: Parent;

    init() {
        self.data = Parent{
            a: 5,
            child: Child{ s: "hello", b: true },
        };
    }

    receive() {
        self.data = self.data;
    }
}