struct IntFlag {
    a: Int;
    b: Bool;
}

contract AssignOrder {
    d: IntFlag;

    init() {
        self.d = IntFlag{b:true, a:5};
    }
}