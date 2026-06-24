struct S {
    val: Int;
}

contract TestContract {
    s: String = "start";
    o: Int?;
    b: Bool = false;
    nested: S;
    num: Int;

    init() {
        self.o = null;
        self.nested = S{ val: 10 };
        self.num = 20;
    }
}