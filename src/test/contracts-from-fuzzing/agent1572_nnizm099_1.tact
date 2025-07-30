struct ComplexInner {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestContract {
    val1: Int = 1;
    val2: Bool = true;
    val3: String = "hello";
    val4: ComplexInner = ComplexInner{a: 7, b: false, c: null};

    init() {
        self.val1 = 123;
        self.val2 = false;
        self.val3 = "hey";
        self.val4 = ComplexInner{a: 9, b: true, c: "hi"};
    }
}