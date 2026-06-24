struct One {
    a:Int;
}

struct Two {
    one: One;
    b: Int;
}

contract StructOrder {
    data: Two;
    init() {
        self.data = Two{one: One{a:1}, b:2};
    }
}