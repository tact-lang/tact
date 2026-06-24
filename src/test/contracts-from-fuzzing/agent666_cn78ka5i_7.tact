struct Inner1 {
    flag: Bool;
}

struct Inner2 {
    count: Int;
}

contract MultiStruct {
    info1: Inner1;
    info2: Inner2;

    init() {
        self.info1 = Inner1{ flag: true };
        self.info2 = Inner2{ count: 42 };
    }
}
