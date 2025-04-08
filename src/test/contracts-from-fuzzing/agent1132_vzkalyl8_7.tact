struct InnerData {
    amount: Int;
    remark: String;
}

contract MultiVars {
    a: Int = 10;
    b: String = "Hello";
    c: Bool = false;
    d: InnerData = InnerData{amount: 1, remark: "A"};
    e: Int? = null;
    f: Bool? = null;
    g: String = "bye";

    init() {
        self.c = true;
        self.e = 123;
        self.f = true;
        self.d = InnerData{amount: 999, remark: "done"};
    }
}