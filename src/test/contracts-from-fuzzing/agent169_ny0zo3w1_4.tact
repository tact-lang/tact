struct S1 {
    int1: Int;
    bool1: Bool;
    str1: String;
}

contract TestContract {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: S1;

    init() {
        self.f1 = 42;
        self.f2 = true;
        self.f3 = "test";
        self.f4 = S1{ int1: 1, bool1: false, str1: "inner" };
    }
}