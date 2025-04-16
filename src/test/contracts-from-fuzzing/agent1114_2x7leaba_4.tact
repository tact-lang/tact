struct Inner {
    a: Int;
    b: Bool;
}

contract OptStructs {
    data1: Inner?;
    data2: Inner?;
    init() {
        self.data1 = null;
        self.data2 = Inner{a: 10, b: true};
    }
}