struct S {
    f1: Int;
    f2: Bool;
}

contract C {
    data: S;
    flag: Bool;

    init() {
        self.data = S{ f1: 1, f2: false };
        self.flag = true;
    }
}