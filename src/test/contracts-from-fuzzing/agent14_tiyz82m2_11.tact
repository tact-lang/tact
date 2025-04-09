struct Small {
    x: Int;
    y: Bool;
}

contract TupleStruct {
    f: Small;

    init() {
        self.f = Small{ x: 3, y: true };
    }
}