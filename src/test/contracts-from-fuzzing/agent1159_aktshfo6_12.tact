struct S {
    a: Int;
    b: Int;
}

contract TestContract {
    optS: S?;
    flag: Bool;

    init() {
        self.optS = null;
        self.flag = true;
    }
}