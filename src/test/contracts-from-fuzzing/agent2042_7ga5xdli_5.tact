struct Inner {
    flag: Bool;
    text: String;
}

contract MultipleStructFields {
    obj1: Inner;
    obj2: Inner;
    init() {
        self.obj1 = Inner{ flag: true, text: "yes" };
        self.obj2 = Inner{ flag: false, text: "no" };
    }
}