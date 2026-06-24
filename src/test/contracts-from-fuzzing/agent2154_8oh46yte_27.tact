struct One {
    val: Int;
}

contract DupFields {
    a: One;
    b: One;

    init() {
        self.a = One{val:1};
        self.b = One{val:2};
    }
}